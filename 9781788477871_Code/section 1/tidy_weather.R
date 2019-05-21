# Load libraries
library(readr)
library(tidyr)

# Read in weather data
weather <- read_tsv("packt_course/untidy_data/untidy_weather.tsv")

# Tidy data
weather <- gather(weather, key = "day", value = "measurement", 3:5)
weather <- spread(weather, key = "variable", value = "measurement")
weather <- separate(weather, col = "city-state", into = c("city", "state"),
                    sep = "-")