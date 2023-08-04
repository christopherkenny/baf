#' Clean Block Assignment Files
#'
#' @param bafs list of block assignment files, named by type
#' @param state if provided, adds the first two digits of the state FIPS to each code
#'
#' @return a tibble with two columns
#' - GEOID: block GEOIDs
#' - target: output GEOIDs for the target geography
#' @export
#'
#' @examples
#' get_baf_10('WA') %>% clean_bafs('WA')
clean_bafs <- function(bafs, state = NULL) {
  noms <- names(bafs)
  abb <- ''
  if (!is.null(state)) abb <- censable::match_fips(state)
  lapply(noms, function(nom) {
    if (nom == 'AIANNH') {
      bafs[[nom]] %>%
        dplyr::transmute(
          GEOID = BLOCKID,
          target = dplyr::if_else(is.na(AIANNHCE), NA_character_, paste0(abb, AIANNHCE))
        )
    } else if (nom == 'INCPLACE_CDP') {
      bafs[[nom]] %>%
        dplyr::transmute(
          GEOID = BLOCKID,
          target = dplyr::if_else(is.na(PLACEFP), NA_character_, paste0(abb, PLACEFP))
        )
    } else if (nom %in% c('CD', 'SDUNI', 'SLDL', 'SLDU')) {
      bafs[[nom]] %>%
        dplyr::transmute(
          GEOID = BLOCKID,
          target = dplyr::if_else(is.na(DISTRICT), NA_character_, paste0(abb, DISTRICT))
        )
    } else if (nom == 'VTD') {
      bafs[[nom]] %>%
        dplyr::transmute(
          GEOID = BLOCKID,
          target = paste0(abb, COUNTYFP, DISTRICT)
        )
    }

  }) %>%
    setNames(noms)
}
