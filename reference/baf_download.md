# Download a file

Download a file

## Usage

``` r
baf_download(url, path, overwrite = FALSE, quiet = FALSE)
```

## Arguments

- url:

  a URL

- path:

  a file path

- overwrite:

  should the file at path be overwritten if it already exists? Default
  is FALSE.

- quiet:

  should output and progress bar be suppressed?

## Value

a path to the downloaded file, invisibly

## Examples

``` r
tf <- tempfile(fileext = '.zip')
ex <- 'https://www2.census.gov/geo/docs/maps-data/data/baf2020/BlockAssign_ST01_AL.zip'
baf_download(url = ex, path = tf)
```
