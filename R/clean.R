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
#' baf('WA') |> clean_bafs('WA')
clean_bafs <- function(bafs, state = NULL) {
  noms <- names(bafs)
  abb <- ''
  if (!is.null(state)) {
    abb <- lookup_state_fips(state)
  }
  lapply(noms, function(nom) {
    if (nom == 'AIANNH') {
      bafs[[nom]] |>
        dplyr::mutate(
          GEOID = .data$BLOCKID,
          target = dplyr::if_else(is.na(.data$AIANNHCE), NA_character_, paste0(abb, .data$AIANNHCE)),
          .keep = 'none'
        )
    } else if (nom == 'INCPLACE_CDP') {
      bafs[[nom]] |>
        dplyr::mutate(
          GEOID = .data$BLOCKID,
          target = dplyr::if_else(is.na(.data$PLACEFP), NA_character_, paste0(abb, .data$PLACEFP)),
          .keep = 'none'
        )
    } else if (nom %in% c('CD', 'SDUNI', 'SLDL', 'SLDU')) {
      bafs[[nom]] |>
        dplyr::mutate(
          GEOID = .data$BLOCKID,
          target = dplyr::if_else(is.na(.data$DISTRICT), NA_character_, paste0(abb, .data$DISTRICT)),
          .keep = 'none'
        )
    } else if (nom == 'VTD') {
      bafs[[nom]] |>
        dplyr::mutate(
          GEOID = .data$BLOCKID,
          target = paste0(abb, .data$COUNTYFP, .data$DISTRICT),
          .keep = 'none'
        )
    }
  }) |>
    stats::setNames(noms)
}
