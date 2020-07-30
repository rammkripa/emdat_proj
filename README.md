# emdat_proj
Project for EMDAT data

## Step by Step Process

1. Obtain Data as Excel file from EMDAT website [here](https://public.emdat.be/).

2. Read Files into R.

3. Drop NA from Location Column.

4. Convert Each name in **Locations** to a Lat Long and check if it is in the box for the given region.

5. Filter out Locations that are not in their boxes

6. Analyse Data

## Current Issues

I am limited to 1000 API Requests per hour by the Geonames API.
Since I make multiple requests per disaster, I am able to obtain data on only 394 disasters.
The rest all generate an error of maximum requests exceeded!

![Batman_gif](https://media.giphy.com/media/dJUtqIcqeyMvK/giphy.gif)