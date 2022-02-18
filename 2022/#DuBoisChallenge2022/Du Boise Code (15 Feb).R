#######
# TidyTuesday 2022 Week 7: #DuBoisChallenge2022
# Franchesca Kuhney
# Completed: February 17, 2022
#######

# Libraries
library(tidyverse)
library(showtextdb)
library(usmap)
library(add2ggplot)
library(curl)

# load data
plate2 <- readr::read_csv('https://raw.githubusercontent.com/ajstarks/dubois-data-portraits/master/challenge/2022/challenge03/data.csv')

# Data Manipulation
plate2.df<-as.data.frame(plate2)
plate2.df<-rename(plate2.df, state=State)

# plotting initial map
p<-plot_usmap(data = plate2.df, values = "Population", exclude = c("HI","AK")) + 
  labs(title = "Relative Black Population of the States of the United States", 
       caption = "Graphic: @fkuhney | #DuBoisChallenge2022 | #TidyTuesday,Wk7 | Source: Anthony Starks") +
  theme(legend.position = "bottom" )
p

# creating color palette
pop.colors <- c("#003300", "#660000",
                "#CC6600", "#FFCC00",
                "#000066",
                "#FFCC99", "#990000",
                "#330000", "#CC3300")  

# adding aesthetics to map
p + 
  ggplot2::scale_fill_manual(values = pop.colors)+
  theme(
    plot.background = element_rect(fill = "#d2b48c"),
    plot.title = element_text(family="mono", 
                               face = "bold", 
                              size = 15,
                              hjust = .5),
    plot.caption = element_text(family = "mono",size = 8),
    panel.background = element_blank(),
    panel.grid = element_blank(),
    axis.text = element_blank(),
    axis.ticks = element_blank(),
    legend.title = element_blank(),
    legend.position = "bottom",
    legend.text = element_text(family = "mono", size = 8),
    legend.background = element_rect(fill = "#d2b48c"),
    legend.key = element_rect(fill = "#d2b48c")
  )


# save plot
ggsave("~/Desktop/DuBois.png", width=10, height = 10)

# Helpful Link: https://jtr13.github.io/cc19/different-ways-of-plotting-u-s-map-in-r.html

