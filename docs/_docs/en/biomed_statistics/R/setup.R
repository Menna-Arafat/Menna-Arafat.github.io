required <- c("readxl","dplyr","tidyr","ggplot2","forcats","tibble","broom","knitr","scales",
              "car","emmeans","effectsize","lmtest","sandwich","rstatix","survival","MASS")
missing_pkg <- required[!vapply(required, requireNamespace, logical(1), quietly=TRUE)]
if (length(missing_pkg)) stop("Install required packages first: ", paste(missing_pkg, collapse=", "))
suppressPackageStartupMessages(invisible(lapply(required, library, character.only=TRUE)))

set.seed(20260828); options(digits=4, scipen=999)
knitr::opts_chunk$set(echo=TRUE, message=FALSE, warning=FALSE, collapse=TRUE, comment="#>",
                      fig.width=8.6, fig.height=4.8, dpi=120, out.width="100%")

pal <- c(Control="#315B74", Drug_A="#9A3E76", Drug_B="#DD765F")
theme_set(theme_minimal(base_size=12.5) + theme(panel.grid.minor=element_blank(), legend.position="top",
  plot.title=element_text(face="bold", colour="#183c56"), strip.text=element_text(face="bold")))

data_path <- file.path("data", "biomedical_data.xlsx")
dat_raw <- readxl::read_excel(data_path, sheet="Biomedical_Data")
dict <- readxl::read_excel(data_path, sheet="Data_Dictionary")
study_design <- readxl::read_excel(data_path, sheet="Study_Design")
reduction_notes <- readxl::read_excel(data_path, sheet="Reduction_Notes", skip=1, col_names=c("item","value"))
stopifnot(is.data.frame(dat_raw), nrow(dat_raw) > 0, is.data.frame(dict), is.data.frame(reduction_notes))

dat <- dat_raw |>
  mutate(treatment_arm=factor(treatment_arm, levels=c("Control","Drug_A","Drug_B")),
         sex_at_birth=factor(sex_at_birth, levels=c("Female","Male")), smoking_status=factor(smoking_status, levels=c("Never","Former","Current")),
         baseline_severity=factor(baseline_severity, levels=c("Mild","Moderate","Severe")), site=factor(site), region=factor(region),
         across(c(clinical_response_12w, adverse_event_12w, event_observed_90d), as.integer),
         biomarker_change=biomarker_week12_ng_mL-biomarker_baseline_ng_mL, sbp_change=sbp_week12_mmHg-sbp_baseline_mmHg,
         crp_change=crp_week12_mg_L-crp_baseline_mg_L, qol_change=qol_week12_0_100-qol_baseline_0_100,
         response=factor(clinical_response_12w, levels=0:1, labels=c("No","Yes")), ae_any=factor(adverse_event_12w, levels=0:1, labels=c("No","Yes")),
         sbp_base=factor(if_else(sbp_baseline_mmHg>=130,"≥130","<130"), levels=c("<130","≥130")),
         sbp_w12=factor(case_when(is.na(sbp_week12_mmHg)~NA_character_, sbp_week12_mmHg>=130~"≥130", TRUE~"<130"), levels=c("<130","≥130")))

fmt_num <- function(x, digits=2) formatC(x, format="f", digits=digits)
fmt_pct <- function(x, digits=1) paste0(formatC(100*x, format="f", digits=digits), "%")
fmt_p <- function(p) ifelse(is.na(p), NA_character_, ifelse(p<0.001, "<0.001", formatC(p, format="f", digits=3)))
kbl <- function(x, digits=2, caption=NULL) knitr::kable(x, digits=digits, caption=caption, booktabs=knitr::is_latex_output(), row.names=FALSE)

mean_ci <- function(x, conf=0.95) { x <- x[is.finite(x)]; n <- length(x); m <- mean(x); se <- sd(x)/sqrt(n); q <- qt(1-(1-conf)/2,n-1); tibble(n=n,mean=m,sd=sd(x),lower=m-q*se,upper=m+q*se) }
robust_lm_tidy <- function(model, type="HC3") { V <- sandwich::vcovHC(model,type=type); b <- coef(model); se <- sqrt(diag(V)); df <- df.residual(model); q <- qt(.975,df); tibble(term=names(b),estimate=unname(b),std.error=unname(se),statistic=unname(b/se),p.value=2*pt(abs(b/se),df=df,lower.tail=FALSE),conf.low=unname(b-q*se),conf.high=unname(b+q*se)) }

risk_contrast <- function(data, outcome, exposed, reference="Control") {
  y <- data[[outcome]]; g <- data$treatment_arm; x1 <- sum(y[g==exposed]==1,na.rm=TRUE); n1 <- sum(g==exposed & !is.na(y)); x0 <- sum(y[g==reference]==1,na.rm=TRUE); n0 <- sum(g==reference & !is.na(y))
  p1 <- x1/n1; p0 <- x0/n0; rd_obj <- prop.test(c(x1,x0),c(n1,n0),correct=FALSE); rr <- p1/p0; rr_se <- sqrt(1/x1-1/n1+1/x0-1/n0); rr_ci <- exp(log(rr)+c(-1,1)*qnorm(.975)*rr_se)
  tibble(comparison=paste(exposed,"vs",reference),risk_exposed=p1,risk_reference=p0,risk_difference=p1-p0,rd_low=rd_obj$conf.int[1],rd_high=rd_obj$conf.int[2],risk_ratio=rr,rr_low=rr_ci[1],rr_high=rr_ci[2])
}

dispersion_test <- function(model) { x2 <- sum(residuals(model,type="pearson")^2); df <- df.residual(model); tibble(Pearson_X2=x2,df=df,dispersion=x2/df,p_value=pchisq(x2,df,lower.tail=FALSE)) }
complete_n <- function(...) sum(complete.cases(...))
skew_stat <- function(x) { x <- x[is.finite(x)]; n <- length(x); if(n<3 || sd(x)==0) return(NA_real_); n/((n-1)*(n-2))*sum(((x-mean(x))/sd(x))^3) }

# Automated assumption-guided selector for teaching comparisons. The estimand is fixed first.
# Shapiro-Wilk is reported as a diagnostic, not used as a switch from means to ranks.
auto_oneway <- function(data, outcome, group="treatment_arm", estimand=c("mean","rank"), alpha=.05, variance_ratio_cut=2) {
  estimand <- match.arg(estimand); d <- tibble(y=data[[outcome]],g=factor(data[[group]])) |> drop_na() |> mutate(g=droplevels(g)); fit <- lm(y~g,d)
  lev <- car::leveneTest(y~g,d,center=median); lev_p <- unname(lev[1,"Pr(>F)"]); vv <- tapply(d$y,d$g,var); vr <- max(vv)/min(vv); sk <- tapply(d$y,d$g,skew_stat)
  sw_p <- if(nrow(d)>=3 && nrow(d)<=5000) shapiro.test(residuals(fit))$p.value else NA_real_; unequal <- is.finite(vr) && (lev_p<alpha || vr>=variance_ratio_cut); shape_flag <- any(abs(sk)>2,na.rm=TRUE)
  if(estimand=="rank") { test <- kruskal.test(y~g,d); post <- rstatix::dunn_test(d,y~g,p.adjust.method="holm"); method <- "Kruskal-Wallis + Dunn-Holm" } else if(unequal) {
    test <- oneway.test(y~g,d,var.equal=FALSE); post <- rstatix::games_howell_test(d,y~g); method <- "Welch ANOVA + Games-Howell"
  } else { fit_aov <- aov(y~g,d); test <- fit_aov; post <- broom::tidy(TukeyHSD(fit_aov)); method <- "One-way ANOVA + Tukey HSD" }
  diagnostics <- tibble(outcome=outcome,n=nrow(d),residual_Shapiro_p=sw_p,Brown_Forsythe_p=lev_p,variance_ratio=vr,max_abs_group_skew=max(abs(sk),na.rm=TRUE),shape_sensitivity_flag=shape_flag,estimand=estimand,selected_method=method)
  if(inherits(test,"aov")){ a <- summary(test)[[1]]; global <- tibble(method=method,statistic=unname(a[1,"F value"]),df=paste(unname(a[1,"Df"]),unname(a[2,"Df"]),sep=","),p.value=unname(a[1,"Pr(>F)"])) } else { global <- tibble(method=method,statistic=unname(test$statistic[1]),df=paste(round(unname(test$parameter),2),collapse=","),p.value=test$p.value) }
  list(data=d,diagnostics=diagnostics,global=global,posthoc=post,test=test,model=fit)
}

auto_categorical <- function(data, row, column, alpha=.05) {
  tab <- table(data[[row]],data[[column]],useNA="no"); chi <- suppressWarnings(chisq.test(tab,correct=FALSE)); sparse <- any(chi$expected<1) || mean(chi$expected<5)>.20
  test <- if(sparse) fisher.test(tab) else chi; method <- if(sparse) "Fisher exact" else "Pearson chi-square"
  list(table=tab,expected=chi$expected,sparse=sparse,method=method,test=test,tidy=broom::tidy(test))
}

auto_ancova <- function(data, response, baseline, group="treatment_arm", transform=c("identity","log"), interaction_alpha=.05) {
  transform <- match.arg(transform); d <- tibble(y=data[[response]],base=data[[baseline]],g=factor(data[[group]])) |> drop_na() |> mutate(g=droplevels(g)); if(transform=="log") d <- d |> filter(y>0,base>0) |> mutate(y=log(y),base=log(base))
  center <- median(d$base); d <- d |> mutate(base_c=base-center); common <- lm(y~base_c+g,d); full <- lm(y~base_c*g,d); int_terms <- grep(":",names(coef(full)),value=TRUE)
  lh <- car::linearHypothesis(full,paste0(int_terms," = 0"),vcov.=sandwich::vcovHC(full,type="HC3"),test="F"); int_p <- unname(lh[nrow(lh),"Pr(>F)"]); selected <- if(is.finite(int_p) && int_p<interaction_alpha) full else common
  bp <- lmtest::bptest(selected); sw_p <- if(nrow(d)>=3 && nrow(d)<=5000) shapiro.test(residuals(selected))$p.value else NA_real_
  diagnostics <- tibble(response=response,n=nrow(d),scale=transform,interaction_p_HC3=int_p,selected_structure=if(identical(selected,full)) "baseline × treatment interaction" else "common slope",Breusch_Pagan_p=bp$p.value,residual_Shapiro_p=sw_p,covariance="HC3")
  list(data=d,center=center,common=common,interaction=full,model=selected,diagnostics=diagnostics,interaction_test=lh)
}

auto_count_model <- function(formula, data, alpha=.05, material_dispersion=1.5) {
  pois <- glm(formula,family=poisson,data=data); disp <- dispersion_test(pois); over <- disp$dispersion>=material_dispersion && disp$p_value<alpha
  model <- if(over) MASS::glm.nb(formula,data=data) else pois; method <- if(over) "Negative binomial" else "Poisson"
  list(model=model,poisson=pois,dispersion=disp,method=method,overdispersed=over)
}
