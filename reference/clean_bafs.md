# Clean Block Assignment Files

Clean Block Assignment Files

## Usage

``` r
clean_bafs(bafs, state = NULL)
```

## Arguments

- bafs:

  list of block assignment files, named by type

- state:

  if provided, adds the first two digits of the state FIPS to each code

## Value

a tibble with two columns

- GEOID: block GEOIDs

- target: output GEOIDs for the target geography

## Examples

``` r
data('example_baf') |>
  clean_bafs('WA')
#> list()
```
