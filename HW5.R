library(readr)
library(dplyr)
library(sf)
library(tigris)
library(ggplot2)
library(forcats)

options(tigris_use_cache = TRUE, tigris_class = "sf")

homicide_df <- read_csv("data/homicide-data.csv")

denver_homicide_df <- homicide_df %>% 
  filter(city == "Denver",
         state == "CO") %>%
  mutate(
    solved_status = case_when(
      disposition == "Closed by arrest" ~ "Solved",
      disposition %in% c("Closed without arrest",
                         "Open/No arrest") ~ "Unsolved",
      TRUE ~ NA_character_),
    race_group = fct_lump(victim_race, n = 3))

denver_homicide_df %>% count(solved_status)
denver_homicide_df %>% count(race_group)
