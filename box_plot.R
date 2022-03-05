library(tidyverse)
library(extrafont)
library(showtext)
font_add_google(name = "Source Sans Pro", family = "SourceSansPro")
showtext_auto()

df <- data.frame(clone =    c("A", "B", "C", "D", "E", "F", "G", "H", "I", "J"),
                 titer =    c(2300, 2100, 2900, 2400, 1900, 1850, 1750, 1600, 2700, 2200),
                 titer_mb = c(2760, 2520, 3480, 2880, 2100, 1700, 1900, 1900, 2900, 2000))

df.new <- pivot_longer(df, -clone, names_to = "condition", values_to = "titer")

source("ggplot2_personal_theme.R")

ggplot(df.new, aes(x = condition, y = titer/1000))+
  geom_boxplot(#lwd = 1,
               color = "#ffffff",
               fill = "#36474f")+
  geom_point(aes(color = clone),
             size = 3.0, shape = 21, stroke = 1, fill = "#36474f")+
  # geom_signif(comparisons = list(c("titer", "titer_mb")), 
  #             map_signif_level=TRUE)+
  scale_x_discrete(breaks=c("titer", "titer_mb"),
                   labels=c("CONTROL", "METHYLENE\nBLUE")) +
  scale_color_manual(values = shubham_palette_dark) +
  ylim(c(0.5, 4)) +
  # Plot Labels
  labs(title="Methylene Blue treatment\nduring Fedbatch",
       subtitle = "Shubham Dutta",
       caption = NULL,
       x = NULL,
       y = "Titer (mg/ml)",
       color = "Clones")+ # Change legend title, use fill or some other property used
  # Plot decoration
  shubham_theme_dark()
