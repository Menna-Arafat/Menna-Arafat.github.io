packages <- c(
  "bookdown",
  "tidyverse",
  "broom",
  "car",
  "rstatix",
  "emmeans",
  "effectsize",
  "boot",
  "lmtest",
  "sandwich",
  "MASS"
)

to_install <- packages[
  !vapply(packages, requireNamespace, logical(1), quietly = TRUE)
]

if (length(to_install)) {
  install.packages(to_install, repos = "https://cloud.r-project.org")
}

message("Required packages are installed.")
