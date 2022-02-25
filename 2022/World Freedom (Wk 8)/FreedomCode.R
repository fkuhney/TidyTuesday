#######
# TidyTuesday 2022 Week 8: Freedom in the World
# Franchesca Kuhney
# Completed: February 24, 2022
#######

install.packages("tidytuesdayR") # This loads the readme and all the datasets for the week of interest
library(tidyverse)
library(gganimate)
library(extrafont)

# Load data
tuesdata <- tidytuesdayR::tt_load(2022, week = 8)
freedom <- tuesdata$freedom

# Aes
loadfonts(device = "win")

# Filtering for relevant country data
americas <- freedom %>% select(Region_Name, year, PR, CL, country) %>% 
  filter(country=="United States of America"| 
           country=="Canada"| 
           country=="Brazil" | 
           country=="Argentina"| 
           country=="Mexico"|
           country=="Peru"|
           country=="Colombia"|
           country=="Bolivia (Plurinational State of)"|
           country=="Venezuela (Bolivarian Republic of)"|
           country=="Chile")

# Wrangle: changing country names and putting in new column
Americas <- americas %>%
  mutate(Country = case_when(country == "Bolivia (Plurinational State of)" ~ "Bolivia",
         country == "Venezuela (Bolivarian Republic of)" ~ "Venezuela",
         country == "United States of America" ~ "United States",
         TRUE ~ country
         ))

# Plot
Americas %>%
  ggplot(aes(x=year, y=CL, group=Country, color=Country)) +
  geom_line() +
  geom_point() +
  ggtitle("Civil Liberties in the Ten Largest Countries of the Americas (1995-2020)") +
  labs(subtitle = "1 = greatest degree of freedom, 7 = smallest degree of freedom")+
  labs(caption="#TidyTuesday | Twitter & Github: fkuhney | Source: Freedom House") +
  ylab("Civil Liberties Score") +
  transition_reveal(year)+
  xlab("Year")+
  theme(panel.background = element_blank())+
  theme(text = element_text(family = "Optima", size = 12))

anim_save("Civil Liberties x Freedom House.gif")
