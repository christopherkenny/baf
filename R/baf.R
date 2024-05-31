#' Download Block Assignment Files (BAF) from the Census Bureau
#'
#' @param state state to download data for.
#' @param year year to download data for. Default is `2020`.
#' @param geographies geography types to download. Default is `NULL`, which gets all available geographies.
#' @param cache_to directory name to save the downloaded data. Default is `baf_download_path()`.
#' @param overwrite Should the data be re-downloaded? Default is `FALSE`.
#'
#' @return a list of [tibble]s for each geography type
#' @export
#'
#' @examples
#' baf('DE', 2020)
baf <- function(state, year = 2020, geographies = NULL,
                cache_to = baf_download_path(), overwrite = FALSE) {
  fips_v <- lookup_state_fips(state)
  abb_v <- lookup_state_abb(state)

  tb_links <- lookup_links(year = year, geographies = geographies)

  lapply(
    seq_len(nrow(tb_links)),
    function(i) {
      if (tb_links$level[i] == 'state') {
        globs <- vapply(seq_along(state), function(st_i) {
          # construct download path ----
          fips <- fips_v[st_i]
          abb <- abb_v[st_i]

          link <- tb_links$url[i]
          link <- glue::glue(link)

          target <- fs::path(cache_to, fs::path_file(link))
          cache_subdir <- fs::path(cache_to, tb_links$decade[i])

          if (!fs::file_exists(target) || overwrite) {
            baf_download(
              url = link,
              path = target,
              overwrite = overwrite
            )
            utils::unzip(target, exdir = cache_subdir)
          }

          fs::path(cache_subdir, fs::path_ext_remove(fs::path_file(link)))
        }, character(1))

        stub <- fs::path_file(globs)
        files <- fs::dir_ls(fs::path_dir(globs), regexp = paste0(stub, '*'))

        short_name <- vapply(seq_along(files), function(i) {
          x <- files[i] |>
            fs::path_file() |>
            fs::path_ext_remove()
          substr(x, 21, nchar(x))
        }, character(1))

        files <- lapply(files, function(f) {
          out <- readr::read_delim(f,
            delim = ifelse(tb_links$decade[1] == 2010, ',', '|'),
            col_types = readr::cols(.default = 'c'),
            progress = interactive()
          )

          if (all(is.na(out[[ncol(out)]]))) {
            out <- NULL
          }

          out
        }) |>
          stats::setNames(short_name)

      } else {
        # download national files
        target <- fs::path(cache_to, fs::path_file(link))

        if (overwrite) {
          fs::file_delete(target)
        }

        baf_download(
          url = link,
          path = target,
          overwrite = overwrite
        )

        cache_subdir <- fs::path(cache_to, tb_links$decade[i])

        utils::unzip(target, exdir = cache_subdir)

        cache_subdir
      }

      files
    }
  ) |>
    unlist(recursive = FALSE)
}
