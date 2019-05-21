# Exercise 1
# Create a function that takes a list of values, and returns a string expressing
# the mean and standard deviation of that list to two significant figures, for
# example "Mean 30, standard deviation 2.1". Compose this function into a
# pipeline to express the mean and standard deviation of the final weights of
# patients in the drug and placebo groups from each district.

describe <- function(values) {
  signif_mean <- signif(mean(values), 2)
  signif_sd <- signif(sd(values), 2)
  paste0("Mean ", signif_mean, ", standard deviation ", signif_sd)
}

# Uncomment the following line to install the tidyverse packages if they are not
# installed already:
# install.packages("tidyverse")
library(tidyverse)
drug_trial <- read_tsv("drug_trial.tsv")
drug_trial %>%
  group_by(district, pill) %>%
  summarise(description = describe(final_weight)) %>%
  ungroup()