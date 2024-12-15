#### Preamble ####
# Purpose: Simulates a dataset of countries matched with number of refugee
# claims in Canada
# Author: Susie Wang
# Date: 1 December 2024
# Contact: sesiesuxian.wang@mail.utoronto.ca
# License: --
# Pre-requisites: The `tidyverse` package must be installed



#### Workspace setup ####
library(tidyverse)
library(janitor)
library(tidyr)

#### Simulate data ####
# Set seed for reproducibility
set.seed(888)

# Define the number of variables and ranges of corresponding values
num_variables <- 3
accepted <- c(500, 1000)
total <- c(1000, 1500)

# Simulate data
simulated_data <- data.frame(
  Afghanistan = sample(accepted[1]:total[2], 2),
  Syria = sample(accepted[1]:total[2], 2),
  Iraq = sample(accepted[1]:total[2], 2)
)

# Display the full simulated data
print(simulated_data)