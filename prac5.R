# Load dplyr package
library(dplyr)

# Load the Global Air Quality dataset
airquality <- read_csv("C:\\Users\\Trupti\\Downloads\\globalAirQuality.csv")


###################################################
# Example 1: Sorting by a Single Variable (Ascending)
###################################################

# Sort by AQI in ascending order (lowest to highest)
airquality_sorted_aqi <- airquality |>
  arrange(aqi)

# Show lowest AQI values
head(airquality_sorted_aqi, 5)



###################################################
# Example 2: Sorting by a Single Variable (Descending)
###################################################

# Sort by PM2.5 in descending order (highest pollution first)
airquality_sorted_pm25_desc <- airquality |>
  arrange(desc(pm25))

# Show highest PM2.5 cities
head(airquality_sorted_pm25_desc, 5)



###################################################
# Example 3: Sorting by Multiple Columns
###################################################
# Primary Sort  : country (A → Z)
# Secondary Sort: aqi (Highest → Lowest)

airquality_multi_sort <- airquality |>
  arrange(country, desc(aqi))

# First 10 rows show countries alphabetically,
# and within each country, highest AQI first
head(airquality_multi_sort, 10)



###################################################
# Example 4: Combined Filter + Sort
###################################################
# Filter: Locations with PM10 > 100 (high dust)
# Sort by CO levels (ascending)

high_pm10_sorted_by_co <- airquality |>
  filter(pm10 > 100) |>
  arrange(co)

cat("Top 5 polluted locations (PM10 > 100) with lowest CO levels:\n")

print(
  high_pm10_sorted_by_co |>
    select(city, country, pm10, co, aqi) |>
    head(5)
)
