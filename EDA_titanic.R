library(tidyverse)
library(randomForest)


# Reading in the data

train <- read.csv("train.csv", stringsAsFactors = F)
test <- read.csv("test.csv", stringsAsFactors = F)

glimpse(train)
summary(train)

sum(is.na(train))

# Bind together the two datasets
full <- bind_rows(train %>% mutate(dset = "train"),
                  test %>% mutate(dset = "test")
                  )
full <- full %>% mutate(dset = factor(dset))

str(full)


# Feature engineering

full$Title <- gsub('(.*, )|(\\..*)', '', full$Name)

# Missing values imputation

# Modelling