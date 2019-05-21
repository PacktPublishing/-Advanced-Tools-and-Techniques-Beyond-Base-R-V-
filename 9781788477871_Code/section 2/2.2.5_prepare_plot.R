# Load libraries
library(readr)
library(lubridate)
library(dplyr)
library(ggplot2)
library(magrittr)

# Load the drug trial dataset
read_tsv("packt_course/patient_data_2/drug_trial.tsv") %>%
  # Calculate the age of each patient
  mutate(year = year(dob)) %>%
  mutate(age = 2017 - year) %>%
  # Draw a plot of patient starting weights by age, sex and district
  ggplot(aes(x = age, y = starting_weight, colour = sex)) +
  geom_point() +
  geom_smooth() +
  facet_wrap(~ district) +
  theme_light() +
  labs(x = "Patient age (years)", y = "Patient starting weight (kg)",
       colour = "Patient sex", title = "Patient starting weight analysis")
