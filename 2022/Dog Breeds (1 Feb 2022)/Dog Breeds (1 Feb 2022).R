# Libraries
library(ggimage)
library(tidyverse)
library(geomtextpath)
library(stringr)
library(showtext)
library(cowplot)
library(MetBrewer)

# Data
breed_traits <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2022/2022-02-01/breed_traits.csv') %>%
  mutate(Breed = str_squish(Breed)) %>% .[, c(1:5, 7, 10:16)]
breed_rank_all <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2022/2022-02-01/breed_rank.csv') %>%
  mutate(Breed = str_squish(Breed)) %>% select(Breed, `2020 Rank`)
