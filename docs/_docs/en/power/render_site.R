# Run from repository root:
# Rscript docs/_docs/en/power/render_site.R

args <- commandArgs(trailingOnly=FALSE)
script <- normalizePath(sub("^--file=","",args[grepl("^--file=",args)]))
setwd(dirname(script))
setwd("../../../..")

status <- system2(
  "bundle",
  c("exec","ruby","tools/build-biomed-pages.rb","--course=power")
)

if(status != 0) stop("Could not render and integrate Power.")