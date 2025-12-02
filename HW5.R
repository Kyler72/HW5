library(readr)
library(dplyr)
library(sf)
library(tigris)
library(ggplot2)
library(forcats)

options(tigris_use_cache = TRUE, tigris_class = "sf")

homicide_df <- read_csv("data/homicide-data.csv")

denver_homiicide_df <- homicide_df %>% 
  filter(city == "Denver",
         state == "CO")
