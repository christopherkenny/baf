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
