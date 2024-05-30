befs <- c(
  # 109 - 112 are identical baf
  cd_113 = 'https://www2.census.gov/programs-surveys/decennial/rdo/mapping-files/2013/113-congressional-district-bef/cd113.zip',
  cd_114 = 'https://www2.census.gov/programs-surveys/decennial/rdo/mapping-files/2015/114-congressional-district-bef/cd114.zip',
  cd_115 = 'https://www2.census.gov/programs-surveys/decennial/rdo/mapping-files/2017/115-congressional-district-bef/cd115.zip',
  cd_116 = 'https://www2.census.gov/programs-surveys/decennial/rdo/mapping-files/2019/116-congressional-district-bef/cd116.zip',
  # 2020 baf - 117
  cd_118 = 'https://www2.census.gov/programs-surveys/decennial/rdo/mapping-files/2023/118-congressional-district-bef/cd118.zip',

  shd_2012 = 'https://www2.census.gov/programs-surveys/decennial/rdo/mapping-files/2012/2012-state-legislative-bef/sldl_post2010.zip',
  ssd_2012 = 'https://www2.census.gov/programs-surveys/decennial/rdo/mapping-files/2012/2012-state-legislative-bef/sldu_post2010.zip',
  shd_2016 = 'https://www2.census.gov/programs-surveys/decennial/rdo/mapping-files/2016/2016-state-legislative-bef/sldl_2016.zip',
  ssd_2016 = 'https://www2.census.gov/programs-surveys/decennial/rdo/mapping-files/2016/2016-state-legislative-bef/sldu_2016.zip',
  shd_2022 = 'https://www2.census.gov/programs-surveys/decennial/rdo/mapping-files/2023/2022-state-legislative-bef/sldl_2022.zip',
  ssd_2022 = 'https://www2.census.gov/programs-surveys/decennial/rdo/mapping-files/2023/2022-state-legislative-bef/sldu_2022.zip'
)

bafs <- c(
  cd_109 = 'https://www2.census.gov/geo/docs/maps-data/data/baf/BlockAssign_ST{fips}_{abb}.zip',
  cd_117 = 'https://www2.census.gov/geo/docs/maps-data/data/baf2020/BlockAssign_ST{fips}_{abbr}.zip',
)

baf_links <- tibble::tribble(
  ~level, ~years, ~geography, ~decade, ~url,
  # congressional districts
  'state',    list(2005:2012), 'cd', 2010, bafs['cd_109'],
  'national', list(2013:2014), 'cd', 2010, befs['cd_113'],
  'national', list(2015:2016), 'cd', 2010, befs['cd_114'],
  'national', list(2017:2018), 'cd', 2010, befs['cd_115'],
  'national', list(2019:2020), 'cd', 2010, befs['cd_116'],
  'state',    list(2021:2022), 'cd', 2020, bafs['cd_117'],
  'national', list(2023:2024), 'cd', 2020, befs['cd_118'],

  # state legislative districts
  'national', list(2012:2015), 'shd', 2010, befs['shd_2012'],
  'national', list(2016:2020), 'shd', 2010, befs['shd_2016'],
  'national', list(2021:2022), 'shd', 2020, befs['shd_2022'],

  'national', list(2012:2015), 'ssd', 2010, befs['ssd_2012'],
  'national', list(2016:2020), 'ssd', 2010, befs['ssd_2016'],
  'national', list(2021:2022), 'ssd', 2020, befs['ssd_2022'],

  # general bafs
  'state', list(2010:2019), 'etc', 2010, bafs['cd_109'],
  'state', list(2020:2029), 'etc', 2020, bafs['cd_117']
)

lookup_links <- function(state, year, geographies) {

  if (is.null(geographies)) {
    geographies <- 'etc'
  }
  if (!all(geographies %in% c('cd', 'shd', 'ssd', 'etc'))) {
    geographies[!geographies %in% c('cd', 'shd', 'ssd', 'etc')] <- 'etc'
  }

  geographies <- unique(geographies)

}
