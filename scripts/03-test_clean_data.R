#### Preamble ####
# Purpose: Tests the cleaned dataset.
# Author: Susie Wang
# Date: 1 December 2024
# Contact: sesiesuxian.wang@mail.utoronto.ca
# License: --
# Pre-requisites: Have the cleaned dataset ready for testing.



#### Workspace setup ####
library(tidyverse)
library(testthat)

data <- read_csv("../data/clean_data.csv")


#### Test data ####
# Test that the cleaned dataset has 50 rows
test_that("dataset has 50 rows", {
  expect_equal(nrow(data), 50)
})

# Test that the dataset has 1+7*11=78 columns
test_that("dataset has 78 columns", {
  expect_equal(ncol(data), 78)
})

# Test that there are no missing values in the dataset
test_that("no missing values in dataset", {
  expect_true(all(!is.na(clean_data)))
})

# Test that 'Countries' contains unique values (no duplicates)
test_that("'Countries' column contains unique values", {
  expect_equal(length(unique(clean_data$Countries)), 50)
})

# Test that there are no empty strings in 'Countries' column
test_that("no empty strings in 'Countries' column", {
  expect_false(any(clean_data$Countries == ""))
})
