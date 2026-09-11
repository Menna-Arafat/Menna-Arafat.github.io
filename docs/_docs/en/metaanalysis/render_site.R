# Run from the repository root: Rscript docs/_docs/en/biomed_statistics/render_site.R
args <- commandArgs(trailingOnly = FALSE)
script <- normalizePath(sub("^--file=", "", args[grepl("^--file=", args)]))
setwd(dirname(script))
bookdown::render_book(
  "01-metaanalysis.Rmd",
  "bookdown::gitbook",
  output_dir="../../../../courses/metaanalysis"
)

# Reuse the original website layout and sidebar for all generated chapters.
setwd("../../../..")
status <- system2("bundle", c("exec", "ruby", "tools/build-biomed-pages.rb","--course=metaanalysis"))
if (status != 0) stop("Could not integrate the rendered chapters into the website.")
