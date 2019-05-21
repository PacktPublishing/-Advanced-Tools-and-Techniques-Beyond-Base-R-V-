# Exercise 1
# Using str_replace(), change each string in 'animals' so it specifies the
# number of animals present. For example, 'a parliament of two hundred and fifty
# owls'. Hint: remember that plain text can be used as a regular expression.
animals <- c("a parliament of owls",
             "a quiver of cobras",
             "an audience of squid",
             "a parade of echidnas")
counts <- c("of a million", "of several", "of gazillions of", "of many")
library(stringr)
library(magrittr)
animals %>% str_replace("of", counts)
## [1] "a parliament of a million owls"
## [2] "a quiver of several cobras"
## [3] "an audience of gazillions of squid"
## [4] "a parade of many echidnas"

# Exercise 2
# Write an R script that, for any input character vector, will return a vector
# consisting of 'I like <element>!' if the input element contains the string
# 'ice cream', and 'I hate <element>!' otherwise.
input <- "chocolate ice cream"
present <- str_detect(input, "ice cream")
str_c(ifelse(present, "I like ", "I hate "), input, "!")