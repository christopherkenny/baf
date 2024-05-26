#' Download a file
#'
#' Backend-agnostic (currently `curl`)
#'
#' @param url a URL
#' @param path a file path
#' @param overwrite should the file at path be overwritten if it already exists? Default is FALSE.
#' @param quiet should output and progress bar be suppressed?
#'
#' @return the `curl` request
#'
#' @noRd
baf_download <- function(url, path, overwrite = FALSE, quiet = FALSE) {
  dir <- dirname(path)
  if (!dir.exists(dir)) dir.create(dir, recursive = TRUE)
  if (!file.exists(path) || overwrite) {
    curl::curl_download(url, path, quiet = quiet)
  } else {
    cli::cli_inform(c('File already downloaded at {.path {path}}',
      '>' = 'Set {.arg overwrite = TRUE} to overwrite.'
    ))
    list(status_code = 200)
  }
}



#' Figure out where to download things
#'
#' @noRd
baf_download_path <- function() {
  user_cache <- getOption('baf.cache_dir')
  if (!is.null(user_cache)) {
    p <- user_cache
  } else if (getOption('baf.use_cache', FALSE)) {
    p <- tools::R_user_dir('maup', 'data')
  } else {
    p <- tempdir()
  }

  if (!dir.exists(p)) {
    dir.create(p, recursive = TRUE)
  }

  p
}
