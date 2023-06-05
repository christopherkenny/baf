get_baf_10 <- function(state, geographies = NULL, cache_to = NULL, refresh = FALSE) {
  if (!is.null(cache_to) && file.exists(cache_to) && !refresh) {
    return(readRDS(cache_to))
  }

  fips <- censable::match_fips(state)
  abb <- censable::match_abb(state)

  zip_path <- tempfile(fileext = '.zip')
  zip_dir <- dirname(zip_path)
  base_name <- str_glue('BlockAssign_ST{fips}_{abb}')
  zip_url <- str_glue('https://www2.census.gov/geo/docs/maps-data/data/baf/{base_name}.zip')
  baf_download(url = zip_url, path = zip_path)

  files <- utils::unzip(zip_path, list = TRUE)$Name
  utils::unzip(zip_path, exdir = zip_dir)
  out <- list()

  for (fname in files) {
    geogr <- str_match(fname, paste0(base_name, '_([A-Z_]+)\\.txt'))[, 2]
    if (!is.null(geographies) && !(geogr %in% geographies)) next
    table <- readr::read_delim(file.path(zip_dir, fname),
                               delim = ',',
                               col_types = readr::cols(.default = 'c'),
                               progress = interactive(), lazy = FALSE
    )
    # check final column is not all NA
    if (!all(is.na(table[[ncol(table)]]))) {
      out[[geogr]] <- table
    }
  }

  if (!is.null(cache_to)) {
    saveRDS(out, file = cache_to, compress = 'gzip')
  }

  withr::deferred_clear()
  out
}
