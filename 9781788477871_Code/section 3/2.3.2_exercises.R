# Exercise 1
# Create a list consisting of one character vector, one numeric vector, and one
# logical vector. Using lapply(), create a vector giving the type of each vector
# in the input list.

mylist <- list(c("a", "b", "c"), 1:5, c(TRUE, FALSE, TRUE))
unlist(lapply(mylist, typeof)) # [1] "character" "integer"   "logical" 

# Exercise 2
# Using lapply(), create a script that, for any list of data frames, will return
# the total number of rows across all the data frames.

# An example list of dataframes from R's built-in datasets and the tidyverse 
# Uncomment the following line to install the tidyverse packages if they are not
# installed already: install.packages("tidyverse")
library(tidyverse)
dataframes <- list(starwars, mpg, txhousing)
lapply(dataframes, nrow) %>%
  unlist() %>%
  sum()