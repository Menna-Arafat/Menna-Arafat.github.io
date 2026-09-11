# ALL of Statistics — revised biomedical bookdown edition

## Fifteen-bookmark course structure

The course is divided into **15 substantive bookmarks/chapters**, excluding the Preface and References. The split follows statistical subjects rather than arbitrary page length:

1. Data foundations and R essentials
2. Descriptive statistics and exploratory data analysis
3. Sampling distributions and confidence intervals
4. Bootstrap, probability models, power, and uncertainty
5. Continuous two-group and paired inference
6. Categorical inference, resampling, and multiplicity
7. ANOVA and robust multi-group comparisons
8. MANOVA and correlation
9. Linear regression and diagnostics
10. ANCOVA, interactions, and continuous outcomes
11. Logistic and count regression
12. Survival analysis and time-to-event models
13. Integrated analysis I: analysis plan, data audit, and automated decision rules
14. Integrated analysis II: continuous outcomes
15. Integrated analysis III: binary, count, and time-to-event outcomes

Within each bookmark, `##`, `###`, and `####` headings further separate estimands, methods, diagnostics, effect estimates, and interpretation to reduce crowding.

This folder contains the revised source files for the biomedical statistics course. The revision focuses on three goals: clearer Markdown hierarchy, more compact visible R code, and statistically defensible analysis language.

## What changed

- Added subject-level `###`/`####` headings inside long sections so concepts, diagnostics, code, and interpretation are visually separated.
- Reorganized the sidebar into 15 substantive bookmarks and synchronized the new chapter URLs with the revised H1 titles.
- Set `options(width=120)` in `index.Rmd` to reduce unnecessary wrapping in printed R output.
- Compacted selected helper and visible code blocks while keeping formulas and model logic readable.
- Retained design-first and estimand-first analysis principles.
- Made Welch one-way ANOVA the default mean-based omnibus test rather than choosing classical versus Welch through a preliminary variance test. Brown–Forsythe and variance ratios remain diagnostics.
- Explicitly label interaction and logistic functional-form selection as teaching/post-selection workflows; selected-model confidence intervals and p-values should not be treated as fully selection-adjusted confirmatory inference.
- Added a caution that pairwise-complete correlation matrices may use different participant subsets for different coefficients.

## Data provenance

The active `Biomedical_Data` sheet contains 360 synthetic participants, 120 per treatment arm. The workbook also documents an original synthetic cohort of 900 participants and the outcome-blind within-arm reduction protocol (seed 20260828). The `Study_Design` sheet still contains legacy text referring to the original 900-participant design; current analyses should use the active data sheet and reduction notes for the teaching-sample denominator.

## Chapter files

- `index.Rmd` — preface and analytical principles
- `01-data-foundations.Rmd` — data foundations and R essentials
- `02-descriptive-eda.Rmd` — descriptive statistics and exploratory data analysis
- `03-sampling-confidence.Rmd` — sampling distributions and confidence intervals
- `04-resampling-probability.Rmd` — bootstrap, probability models, power, and uncertainty
- `05-continuous-inference.Rmd` — continuous two-group and paired inference
- `06-categorical-resampling.Rmd` — categorical inference, resampling, and multiplicity
- `07-anova-robust.Rmd` — ANOVA and robust multi-group comparisons
- `08-manova-correlation.Rmd` — MANOVA and correlation
- `09-linear-regression.Rmd` — linear regression and diagnostics
- `10-ancova-continuous.Rmd` — ANCOVA, interactions, and continuous outcomes
- `11-logistic-count.Rmd` — logistic and count regression
- `12-survival-analysis.Rmd` — survival analysis and time-to-event models
- `13-integrated-analysis-I.Rmd` — analysis plan, data audit, and automated teaching rules
- `14-integrated-analysis-II.Rmd` — continuous integrated analysis
- `15-integrated-analysis-III.Rmd` — binary, count, and survival integrated analysis
- `16-references.Rmd` — references

## Rendering

`_bookdown.yml` now matches the canonical filenames in this folder. The supplied `render_site.R` still expects the repository-level website layout and the existing project support files such as `R/setup.R`, `references.bib`, and any site build scripts. Those support files were not part of this upload and were therefore not reconstructed here.
