# Download Block Assignment Files (BAF) from the Census Bureau

Download Block Assignment Files (BAF) from the Census Bureau

## Usage

``` r
baf(
  state,
  year = 2020,
  geographies = NULL,
  cache_to = baf_download_path(),
  overwrite = FALSE
)
```

## Arguments

- state:

  state to download data for.

- year:

  year to download data for. Default is `2020`.

- geographies:

  geography types to download. Default is `NULL`, which gets all
  available geographies.

- cache_to:

  directory name to save the downloaded data. Default is
  [`baf_download_path()`](http://christophertkenny.com/baf/reference/baf_download_path.md).

- overwrite:

  Should the data be re-downloaded? Default is `FALSE`.

## Value

a list of
[dplyr::tibble](https://dplyr.tidyverse.org/reference/reexports.html)s
for each geography type

## Examples

``` r
baf('DE', 2020)
#> $AIANNH
#> # A tibble: 20,198 × 3
#>    BLOCKID         AIANNHCE COMPTYP
#>    <chr>           <chr>    <chr>  
#>  1 100010401001000 NA       NA     
#>  2 100010401001001 NA       NA     
#>  3 100010401001002 NA       NA     
#>  4 100010401001003 NA       NA     
#>  5 100010401001004 NA       NA     
#>  6 100010401001005 NA       NA     
#>  7 100010401001006 NA       NA     
#>  8 100010401001007 NA       NA     
#>  9 100010401001008 NA       NA     
#> 10 100010401001009 NA       NA     
#> # ℹ 20,188 more rows
#> 
#> $CD
#> # A tibble: 20,198 × 2
#>    BLOCKID         DISTRICT
#>    <chr>           <chr>   
#>  1 100010401001000 00      
#>  2 100010401001001 00      
#>  3 100010401001002 00      
#>  4 100010401001003 00      
#>  5 100010401001004 00      
#>  6 100010401001005 00      
#>  7 100010401001006 00      
#>  8 100010401001007 00      
#>  9 100010401001008 00      
#> 10 100010401001009 00      
#> # ℹ 20,188 more rows
#> 
#> $INCPLACE_CDP
#> # A tibble: 20,198 × 2
#>    BLOCKID         PLACEFP
#>    <chr>           <chr>  
#>  1 100010401001000 NA     
#>  2 100010401001001 NA     
#>  3 100010401001002 NA     
#>  4 100010401001003 NA     
#>  5 100010401001004 NA     
#>  6 100010401001005 NA     
#>  7 100010401001006 NA     
#>  8 100010401001007 NA     
#>  9 100010401001008 NA     
#> 10 100010401001009 NA     
#> # ℹ 20,188 more rows
#> 
#> $SDUNI
#> # A tibble: 20,198 × 2
#>    BLOCKID         DISTRICT
#>    <chr>           <chr>   
#>  1 100010401001000 01620   
#>  2 100010401001001 01620   
#>  3 100010401001002 01620   
#>  4 100010401001003 01620   
#>  5 100010401001004 01620   
#>  6 100010401001005 01620   
#>  7 100010401001006 01620   
#>  8 100010401001007 01620   
#>  9 100010401001008 01620   
#> 10 100010401001009 01620   
#> # ℹ 20,188 more rows
#> 
#> $SLDL
#> # A tibble: 20,198 × 2
#>    BLOCKID         DISTRICT
#>    <chr>           <chr>   
#>  1 100010401001000 011     
#>  2 100010401001001 011     
#>  3 100010401001002 011     
#>  4 100010401001003 011     
#>  5 100010401001004 011     
#>  6 100010401001005 011     
#>  7 100010401001006 011     
#>  8 100010401001007 011     
#>  9 100010401001008 011     
#> 10 100010401001009 011     
#> # ℹ 20,188 more rows
#> 
#> $SLDU
#> # A tibble: 20,198 × 2
#>    BLOCKID         DISTRICT
#>    <chr>           <chr>   
#>  1 100010401001000 015     
#>  2 100010401001001 015     
#>  3 100010401001002 015     
#>  4 100010401001003 015     
#>  5 100010401001004 015     
#>  6 100010401001005 015     
#>  7 100010401001006 015     
#>  8 100010401001007 015     
#>  9 100010401001008 015     
#> 10 100010401001009 015     
#> # ℹ 20,188 more rows
#> 
#> $VTD
#> # A tibble: 20,198 × 3
#>    BLOCKID         COUNTYFP DISTRICT
#>    <chr>           <chr>    <chr>   
#>  1 100010401001000 001      001-29  
#>  2 100010401001001 001      001-29  
#>  3 100010401001002 001      001-29  
#>  4 100010401001003 001      001-29  
#>  5 100010401001004 001      001-29  
#>  6 100010401001005 001      001-29  
#>  7 100010401001006 001      001-29  
#>  8 100010401001007 001      001-29  
#>  9 100010401001008 001      001-29  
#> 10 100010401001009 001      001-29  
#> # ℹ 20,188 more rows
#> 
```
