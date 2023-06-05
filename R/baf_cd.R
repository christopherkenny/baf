#' Download 2010 Block Assignment File to 113th Congressional Districts
#'
#' @return path to new zip directory, invisibly
#' @export
download_baf_cd113 <- function() {
  zip_dir <- fs::dir_create('data-raw/ZZ_baf_cd113')
  zip_url <- 'https://www2.census.gov/programs-surveys/decennial/rdo/mapping-files/2013/113-congressional-district-bef/cd113.zip'
  zip_path <- paste0(zip_dir, '/cd113.zip')
  baf_download(url = zip_url, path = zip_path)
  utils::unzip(zip_path, exdir = zip_dir)
  invisible(zip_dir)
}
