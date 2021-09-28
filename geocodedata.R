library(weed)
library(tidyverse)
data <- weed::read_emdat(here('fullemdat.xlsx'))
df <- data$disaster_data
for (x in 74000:74034){
  print(x)
  geocoded_dfs[[x]] <- df %>%
    split_locations(column_name = 'Location') %>%
    head(n= x) %>%
    tail(n = 1) %>%
    geocode(geonames_username = 'rammkripa')
  if ((x %% 900) == 0){
    print("")
    Sys.sleep(3800)
  }
}
geocoded_df12 <- df %>%
  split_locations(column_name = 'Location') %>%
  head(n=10800) %>%
  tail(n = 1) %>%
  geocode(geonames_username = 'rammkripa')

geocoded_dfs[[10803]]

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

merged_df %>%
  percent_located_disasters()

merged_df3 <- bind_rows(geocoded_dfs[38704:74034])

total_df %>%
  write_csv(here('cleaned_mostly_full_emdat.csv'))

full_emdat_df <- bind_rows(total_df, merged_df3)
full_emdat_df %>%
  percent_located_disasters(plot_result = FALSE)


