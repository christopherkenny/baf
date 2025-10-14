## Test environments

* local R installation (Windows 11), R 4.5.1
* local R installation (macOS), R 4.5.1
* ubuntu-latest (on GitHub Actions), (devel and release)
* windows-latest (on GitHub Actions), (release)
* macOS-latest (on GitHub Actions), (release)
* Windows (on Winbuilder), (devel and release)

## R CMD check results

0 errors | 0 warnings | 0 notes

## Additional notes

* This adds another condition for test skipping, as some US government data sources are returning 200 statuses for redirects during to the government shutdown.
