# Install required packages
install.packages("dplyr")

library(dplyr)
library(readr) # For efficient CSV reading

# Load the Global Air Quality dataset
airquality <- read_csv("C:\\Users\\Trupti\\Downloads\\globalAirQuality.csv")

# Quick look at the dataset
head(airquality)


#############################################
# Method 1: subset() – Base R filtering
#############################################

# Example 1: Single Condition
# Filter for locations where AQI is above 150 (unhealthy)

high_aqi_subset <- subset(airquality, aqi > 150)

cat("Number of high AQI locations (aqi > 150):", nrow(high_aqi_subset), "\n")
summary(high_aqi_subset$aqi)


# Example 2: Multiple Conditions (AND)
# AQI > 150 AND PM2.5 > 100

poor_air_subset <- subset(airquality, aqi > 150 & pm25 > 100)

cat("Poor air quality (AQI > 150 & PM2.5 > 100):", nrow(poor_air_subset), "\n")
head(poor_air_subset)


# Example 3: Multiple Conditions (OR)
# Either PM2.5 > 120 OR PM10 > 180

special_pollution_subset <- subset(airquality, pm25 > 120 | pm10 > 180)

cat("Number of high pollution cases:", nrow(special_pollution_subset), "\n")
head(special_pollution_subset)



#############################################
# Method 2: Using dplyr::filter()
#############################################

# Example 1: Single Condition using pipes
# NO2 < 20

low_no2_filter <- airquality |>
  filter(no2 < 20)

cat("Low NO2 locations (no2 < 20):", nrow(low_no2_filter), "\n")
summary(low_no2_filter$no2)


# Example 2: Multiple Conditions (comma = AND)
# Not India AND O3 > 30

high_o3_not_india <- airquality |>
  filter(country != "India", o3 > 30)

cat("High O3 locations outside India:", nrow(high_o3_not_india), "\n")
head(high_o3_not_india)


# Example 3: Using %in%
# Countries: India, China, USA

selected_countries <- airquality |>
  filter(country %in% c("India", "China", "USA"))

cat("Locations in India/China/USA:", nrow(selected_countries), "\n")
table(selected_countries$country)
