# Statistical and structural QA notes

## Dataset checks

The active `Biomedical_Data` sheet contains **360 participants** and **35 variables**, with **120 participants in each randomized arm**. The workbook's reduction documentation records an original synthetic cohort of 900 participants and an outcome-blind reduction to 360. The `Study_Design` sheet retains legacy wording that still says 900 participants; current chapter denominators should therefore come from the active data sheet / reduction notes rather than that legacy cell.

Observed reduced-sample endpoint counts agree with the workbook summaries:

| Endpoint | Control | Drug_A | Drug_B |
|---|---:|---:|---:|
| Clinical responses | 32 / 120 | 52 / 120 | 70 / 120 |
| Any adverse event | 5 / 120 | 10 / 120 | 22 / 120 |

There are **44 observed time-to-event events** in the 360-participant teaching dataset.

## Checks on hard-coded continuous-outcome conclusions

The ANCOVA interaction statements were independently checked against the active worksheet using ordinary least squares with HC3 covariance and a joint two-degree-of-freedom Wald test for the baseline-by-treatment interaction coefficients.

| Endpoint/model | Complete cases | HC3 joint interaction p-value | Current teaching conclusion |
|---|---:|---:|---|
| Week-12 biomarker ~ baseline × treatment | 349 | ~3.0 × 10^-21 | interaction clearly supported |
| Week-12 SBP ~ baseline × treatment | 353 | 0.249 | common slope is adequate as a teaching summary |
| Week-12 QoL ~ baseline × treatment | 347 | 0.574 | common slope is adequate as a teaching summary |
| log week-12 CRP ~ log baseline × treatment | 336 | 0.351 | common slope log model is adequate |

These checks support the chapter-specific claims about which endpoint shows strong baseline-dependent treatment effects.

## Binary and count checks

For the 3 × 2 clinical-response table, the minimum Pearson expected count is about **51.3**, so the chi-square approximation is unproblematic. For any adverse event, the minimum expected count is about **12.3**, so the global 3 × 2 table is also adequate for Pearson chi-square; pairwise exact analyses remain a reasonable safety sensitivity analysis.

For the adjusted Poisson adverse-event count model, the Pearson dispersion ratio is approximately **1.09** with one-sided overdispersion p ≈ **0.12**. Under the course's stated teaching rule (dispersion > 1.5 and p < .05), the reduced dataset selects **Poisson**, not negative binomial.

## Methodological corrections made

1. **Welch ANOVA is now the default one-way mean comparison.** Brown-Forsythe and variance-ratio results remain diagnostics rather than a preliminary gatekeeper that chooses classical versus Welch inference.
2. **Rank tests remain estimand-driven.** A small normality p-value does not switch a mean estimand to a rank estimand.
3. **Interaction and spline selection are labeled as post-selection teaching workflows.** Confidence intervals and p-values from a selected model do not automatically account for the selection step and should not be described as fully confirmatory inference.
4. **Sparse-table automation is described as a conservative teaching convention**, not as a universal expected-count theorem.
5. **Pairwise-complete correlation matrices now carry an explicit caution** that different entries can use different participant subsets.
6. **Model-scale interpretation is preserved** for linear, log-linear, logistic, count, and Cox models.

## Structural checks

- All 11 `rmd_files` listed in `_bookdown.yml` exist in the revised folder under the canonical filenames.
- `navigation.yml` parses as valid YAML; chapter URLs are unchanged while sidebar titles are shortened.
- All R Markdown code fences are balanced.
- Long sections were subdivided with subject-level Markdown headings.
- Visible R code was compacted while keeping continuation lines readable; `options(width=120)` was added to reduce printed-output wrapping.

## Validation limitation

A full bookdown render was not executed because the available runtime does not include R, and the uploaded set does not contain the existing project support files referenced by the chapters (`R/setup.R`, `references.bib`, and the repository website build scripts). Statistical statements that can be checked directly from the supplied workbook were validated independently as summarized above.

## Readability revision v2

- Added subject-specific level-4 Markdown headings throughout the analytical chapters.
- Split the Integrated Analysis I automation helpers into six statistical subjects with hidden code retained under concise explanatory text.
- Integrated chapters now explicitly follow question → specification → diagnostics → effect estimate → interpretation where applicable.
- Existing statistical decisions and endpoint estimands were preserved; this pass is primarily structural and presentational.


## Fifteen-bookmark restructuring

The nine substantive source chapters were reorganized into 15 statistically coherent bookmarks. Preface and References remain unnumbered. Cross-chapter references were updated to the new chapter numbering, and the navigation and `_bookdown.yml` order were synchronized.
