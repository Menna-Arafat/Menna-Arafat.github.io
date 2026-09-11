# Quality-assurance report

## Scope

The supplied PowerPoint and R Markdown materials were consolidated into a single bookdown project. Statistical content was revised where formulas, assumptions, or interpretations were incomplete or potentially misleading.

## Source-grounded revisions

The revised project includes all major topics present in the supplied materials:

- R foundations, data types, descriptive statistics, and exploratory graphics
- sampling distributions, central limit theorem, bootstrap, confidence intervals, and permutation tests
- independent and paired t-tests
- Mann-Whitney-Wilcoxon and Wilcoxon signed-rank tests
- chi-square, Fisher exact, McNemar, and stratified CMH analysis
- one-way and factorial ANOVA, Welch ANOVA, Kruskal-Wallis, Tukey and Games-Howell comparisons
- MANOVA, Pearson and Spearman correlation
- simple/multiple linear regression, interactions, diagnostics, nested-model comparison
- logistic regression and adjusted probabilities
- Poisson and negative-binomial count regression
- an integrated biomedical assignment/case study

A detailed correction log is in `10-technical-corrections.Rmd`.

## Structural checks completed

- **104** named R chunks were checked for duplicate labels: **none found**.
- All R Markdown files have balanced code fences and fenced-div callouts.
- All citation keys used in the chapters are present in `references.bib`.
- Every R Markdown chapter passed a Pandoc Markdown parse check.
- The book order is explicitly declared in `_bookdown.yml`.
- The custom CSS, bibliography, package installer, data dictionary, and common R setup file are included.

## Self-contained teaching data

The Excel workbook referenced by the source Rmd files was not among the uploads. A deterministic simulated teaching dataset was therefore created with the same analysis structure.

- rows: **360**
- treatment allocation: **120 per arm**
- duplicate participant IDs: **0**
- deliberately missing cells: **157**
- dataset is explicitly labeled **simulated / non-patient data** throughout the project

## Independent numerical cross-checks

Because an R runtime is not installed in the current execution environment, the R book itself could not be knitted here. Key statistical workflows were independently cross-checked with Python/SciPy/statsmodels on the included simulated dataset:

- Drug_A minus Control mean biomarker change: **-8.16 ng/mL**
- Welch two-sample test p-value: **2.08e-16**
- baseline-adjusted Drug_A treatment coefficient in the ANCOVA model: **-8.07 ng/mL**
- corresponding ANCOVA p-value: **2e-16**
- adjusted Drug_A odds ratio for clinical response: **2.57**
- corresponding logistic-regression p-value: **0.0042**
- Pearson dispersion ratio from the Poisson adverse-event model: **1.68**, supporting the book's negative-binomial overdispersion example

These checks confirm that the simulated data produce coherent pedagogical examples for the revised analyses.

## Important build limitation

The final `bookdown::render_book()` command was **not executed in this environment because R is unavailable**. The project is structured to render in R/RStudio after installing the packages listed in `install_packages.R`.

The remaining validation step on the user's machine is therefore:

```r
source("install_packages.R")
bookdown::render_book("index.Rmd", "bookdown::bs4_book")
```

