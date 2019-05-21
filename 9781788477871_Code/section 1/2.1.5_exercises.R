# Exercise 1
# In the exercise for the previous video, you wrote a script to tidy some data
# about fishing. Rewrite this script using the pipe function.

# Libraries
library(readxl)
library(tidyr)
library(magrittr)

# Load the spreadsheet
fishing <- read_excel("untidy_fishing.xlsx") %>%
  # Gather together the three year columns
  gather(key = "year", value = "count", 3:5) %>%
  # Spread the fish_caught and rods_broken variables into separate columns
  spread(key = "record", value = "count") %>%
  # Separate the angler column into first and last names
  separate("angler", into = c("firstname", "lastname"), sep = " ")