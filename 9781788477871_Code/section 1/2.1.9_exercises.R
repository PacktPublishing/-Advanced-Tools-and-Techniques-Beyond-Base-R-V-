# Exercise 1
# Load the drug trial dataset. Combine the north, south, east and west districts
# into single district called 'regional'. Create a new column giving the percent
# change in weight for each patient during the trial. Produce a summary giving
# the mean and standard deviation percent change in weight for patients in the
# central and regional districts in each of the drug and placebo groups.

# Libraries
library(readr)
library(forcats)
library(dplyr)

# Load the drug trial data set
drug_trial <- read_tsv("drug_trial.tsv") %>%
  # Combine the regional districts
  mutate(
    district = fct_recode(
      district,
      regional = "north",
      regional = "south",
      regional = "east",
      regional = "west"
    )
  ) %>%
  # Calculate the percent change in weight for each patient
  mutate(weight_change_pct = 100 * (final_weight - starting_weight) / starting_weight) %>%
  # Sumarise weight change by district
  group_by(district, pill) %>%
  summarise(
    mean_weight_change_pct = mean(weight_change_pct),
    sd_weight_change_pct = sd(weight_change_pct)
  ) %>%
  ungroup()
