#!/usr/bin/env Rscript

library(argparser, quietly=TRUE)

main <- function(script) {
    argv <- getargs()
    ## TODO Here's where the code goes
}


getargs <- function() {
    p <- arg_parser('Program does x')  ## TODO program description
    p <- add_argument(p, '--verbose', flag=TRUE, help='verbose logging')
    ## TODO add script arguments
    p <- add_argument(p, 'files', nargs=Inf, help='files to process')
    return parse_args(p)
}

# ----------- Helper methods -------------

thisfile <- function() { # find the path to the source file
    # returns path to the script
  if (!is.null(res <- thisfile_source())) res
  else if (!is.null(res <- thisfile_rscript())) res
  else if (!is.null(res <- thisfile_knit())) res
  else if (!is.null(res <- thisfile_rstudio_source())) res
  else if (!is.null(res <- thisfile_rstudio_run())) res
  else NULL
}

thisfile_source <- function() {  # path if program is loaded by source() in another R script
  for (i in -(1:sys.nframe())) {
    if (identical(args(sys.function(i)), args(base::source)))
      return (normalizePath(sys.frame(i)$ofile))
  }
  NULL
}

thisfile_rstudio_source <- function() {  # path if program is loaded by source() in RStudio
  for (i in -(1:sys.nframe())) {
    if (identical(args(sys.function(i)), args(base::source)))
      return (normalizePath(sys.frame(i)$fileName))
  }
  NULL
}

thisfile_rscript <- function() {  # path if run as script from command line
  cmd_args <- commandArgs(trailingOnly = FALSE)
  cmd_args_trailing <- commandArgs(trailingOnly = TRUE)
  leading_idx <-
    seq.int(from=1, length.out=length(cmd_args) - length(cmd_args_trailing))
  cmd_args <- cmd_args[leading_idx]
  res <- gsub("^(?:--file=(.*)|.*)$", "\\1", cmd_args)
  # If multiple --file arguments are given, R uses the last one
  res <- tail(res[res != ""], 1)
  if (length(res) > 0)
    return (res)
  NULL
}

thisfile_knit <- function() {  # path is loaded via knitr
  if (requireNamespace("knitr"))
    return (knitr::current_input())
  NULL
}

thisfile_rstudio_run <- function() {  # path if run via RStudio run()
    if (requireNamespace("rstudioapi"))
        return(normalizePath(rstudioapi::getActiveDocumentContext()$path))
    NULL
}
script.path <- thisfile()
script.dir <- dirname(script.path)

main(script)
