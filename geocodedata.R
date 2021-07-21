library(weed)
library(tidyverse)
data <- weed::read_emdat(here('suhasdata.xlsx'))
df <- data$disaster_data
geocoded_df <- df %>%
  split_locations(column_name = 'Location') %>%
  geocode_batches(geonames_username = 'rammkripa', wait_time = 3600) 

geocoded_df %>%
  percent_located_locations(plot_result = FALSE)

geocoded_df %>%
  write_csv(here('suhasdataclean.csv'))