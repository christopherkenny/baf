# library(tidyverse)
# example_baf <- baf('WA')
# example_baf <- example_baf |>
#   lapply(function(df) {
#     df |>
#       filter(str_starts(BLOCKID, '53001'))
#   })
# usethis::use_data(example_baf, overwrite = TRUE)

#' Example BAF data from Adams County, WA
#'
#' @name example_baf
#'
#' @description
#' list of tibbles with 1,562 rows each
#'
#' @return tibble with state identifying information
#'
#' @usage
#' data('example_baf')
#'
#' @examples
#' data('example_baf')
#' @md
#' @concept example_baf
NULL
