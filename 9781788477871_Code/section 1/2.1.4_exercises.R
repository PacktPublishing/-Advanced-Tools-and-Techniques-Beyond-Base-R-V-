# Exercise 1
# You have been given a Microsoft Excel spreadsheet containing some data about
# fishing. Read this data into R, then tidy it. Note that the angler's first
# name and last name should be in separate columns.

# When writing a complicated script that uses many packages, it's good practice
# to load all the packages together at the start of the script
library(readxl)
library(tidyr)

# Load the spreadsheet
fishing <- read_excel("untidy_fishing.xlsx")

# Gather together the three year columns
fishing <- gather(fishing, key = "year", value = "count", 3:5)

# Spread the fish_caught and rods_broken variables into separate columns
fishing <- spread(fishing, key = "record", value = "count")

# Separate the angler column into first and last names
fishing <- separate(fishing, "angler", into = c("firstname", "lastname"),
                    sep = " ")