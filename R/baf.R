#' Download Block Assignment Files (BAF) from the Census BureaU
#'
#' @param state state to download data for.
#' @param year year to download data for. Default is `2020`.
#' @param geographies geography types to download. Default is `NULL`, which gets all available geographies.
#' @param cache_to directory name to save the downloaded data. Default is `baf_download_path()`.
#' @param refresh Should the data be re-downloaded? Default is `FALSE`.
#'
#' @return a list of [tibble]s for each geography type
#' @export
#'
#' @examples
#' baf('DE', 2020)
baf <- function(state, year = 2020, geographies = NULL,
                cache_to = baf_download_path(), refresh = FALSE) {


}
