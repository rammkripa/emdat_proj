library(weed)
library(tidyverse)
data <- weed::read_emdat(here('fullemdat.xlsx'))
df <- data$disaster_data
geocoded_dfs = list()
for (x in 10801:74000){
  print(x)
  geocoded_dfs[x] <- df %>%
    split_locations(column_name = 'Location') %>%
    head(n= x) %>%
    tail(n = 1) %>%
    geocode(geonames_username = 'rammkripa')
  if ((x %% 900) == 0){
    Sys.sleep(3600)
  }
}
geocoded_df12 <- df %>%
  split_locations(column_name = 'Location') %>%
  head(n=10800) %>%
  tail(n = 1) %>%
  geocode(geonames_username = 'rammkripa')

geocoded_dfs[[10901]]

Sys.time()

geocoded_df %>%
  mutate(newcol = location_word %in% c('bengal', 'madras', 'andhra pradesh')) %>%
  select(location_word, newcol) %>%
  

  

geocoded_df8 %>%
  write_csv(here('emdatfull', 'emdatdataclean7.csv'))

# 1 -> 0 to 900

geocoded_df %>%
  filter(!(location_word %in% c('west bengal', 'andhra pradesh', 'tamil nadu', 'karnataka', 'kerala', 'telangana', 'odisha', 'orissa', 'maharashtra', 'madhya pradesh', 'chhattisgarh', 'jharkhand', 'madhya pradesh', 'gujarat', 'meghalaya', 'assam', 'arunachal pradesh', 'nagaland', 'manipur', 'mizoram', 'tripura', 'bihar', 'uttar pradesh', 'uttarakhand', 'himachal pradesh', 'harayana', 'rajasthan', 'punjab', 'kashmir', 'jammu', 'bengal'))) %>%
  write_csv(here('suhasdata_nostates.csv'))

