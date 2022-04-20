# Description:

# Load Packages
library(readxl)
library(haven)
library(tidyverse)

# load data bases
data_path <- "~/Dropbox/env_poli/data/"

input_1 <- "DisasterSummaries.csv"
input_2 <- "elections_merged.csv"

disasters.df <- read.csv(paste0(data_path, input_1))
elections.df <- read.csv(paste0(data_path, input_2)) %>%
    select(-contains("top"), -contains("bottom"), -freq, -contains("ranking"), -candidate_name, -contains("group"))

# join data-sets
elec_env.df <- 
    elections.df %>%
    left_join(., disasters.df, by = c("race_year" = "fyDeclared",
                                      "state_abbr" = "state"))

#write.csv(elec_env.df, paste0(data_path, "elec_env_merged.csv"))

