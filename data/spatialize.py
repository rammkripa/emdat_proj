import pandas as pd
import numpy as np
import scipy
df = pd.read_csv("~/Desktop/projects/emdat_proj/data/df_to_be_spatialized.csv")
lat_index = np.arange(start = -90, stop = 90, step = 2.5)
lng_index = np.arange(start = -180, stop = 180, step = 2.5)
months_index = np.arange(start = min(df['month_number']), stop = max(df['month_number']), step = 1)
dis_type_index = df['Disaster Type'].unique().tolist()
multi_index = pd.MultiIndex.from_product([lat_index, lng_index, months_index, dis_type_index], names = ['lat', 'lng', 'months', 'dis_type'])
df_w_index = df.set_index(['lat_box', 'lng_box', 'month_number', 'Disaster Type'])
df_w_new_index = df_w_index.reindex(multi_index)
df_xarray = df_w_new_index.to_xarray()
df_xarray.to_netcdf("enso_disaster_data.nc")
