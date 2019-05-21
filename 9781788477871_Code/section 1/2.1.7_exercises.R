# Exercise 1
# In the drug trial dataset, convert the sex and pill columns to factors.
# Replace 'F' with 'Female' and 'M' with 'Male' in the sex column. Replace
# 'drug' with 'D' and 'placebo' with 'P' in the pill column.

# Load libraries
library(readr)
library(forcats)
library(magrittr)

# Load the drug trial dataset
drug_trial <- read_tsv("drug_trial.tsv")

# Convert the sex and pill columns to factors
drug_trial$sex <- factor(drug_trial$sex)
drug_trial$pill <- factor(drug_trial$pill)

# Replace levels in sex column
drug_trial$sex <- fct_recode(drug_trial$sex, "Female" = "F", "Male" = "M")

# Replace levels in pill column
drug_trial$pill <- fct_recode(drug_trial$pill, "D" = "drug", "P" = "placebo")
