#### Preamble ####
# Purpose: Have the raw data set that splits data in 2013-2023 into 11 sheets
# gathered into one data frame.
# Author: Susie Wang
# Date: 1 December 2024
# Contact: sesiesuxian.wang@mail.utoronto.ca
# License: --
# Pre-requisites: Have the raw data set ready for any operation.

#### Workspace setup ####
library(tidyverse)
library(readxl)
library(dplyr)


#### Clean Data ####
# import raw data set
file_path <- "../data/raw_data.xlsx"

# read file
sheet_names <- excel_sheets(file_path)
sheet_data <- lapply(sheet_names, function(sheet) {
  read_excel(file_path, sheet = sheet)
})

# Start with the first sheet
merged_data <- sheet_data[[1]]

# Merge all sheets and have yearly data of each country in one row
for (i in 2:11) {
  merged_data <- full_join(
    merged_data,
    sheet_data[[i]],
    by = "Countries", # Match rows based on this column
    suffix = c("", paste0("_Sheet", i)) # Add suffixes to new columns
  )
}

# There are too many missing values in the data set
# We will select the 50 countries with the least missing values
data_with_missing_count <- merged_data %>%
  mutate(missing_count = rowSums(is.na(.)))

# Arrange rows by the number of missing values in ascending order
ordered_data <- data_with_missing_count %>%
  arrange(missing_count)

# Select the top 50 rows
clean_data <- ordered_data %>%
  slice_head(n = 50)

# Drop the `missing_count` column if no longer needed
clean_data <- select(clean_data, -missing_count)
clean_data[is.na(clean_data)] <- 0

#### Save data ####
write_csv(clean_data, "../data/clean_data.csv")
