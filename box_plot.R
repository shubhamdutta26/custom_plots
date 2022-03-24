library(tidyverse)
library(extrafont)
library(showtext)
font_add_google(name = "Source Sans Pro", family = "SourceSansPro")
showtext_auto()

df = data.frame(clone =    c("A", "B", "C", "D", "E", "F", "G", "H", "I", "J"),
                titer =    c(2300, 2100, 2900, 2400, 1900, 1850, 1750, 1600, 2700, 2200),
                titer_mb = c(2760, 2520, 3480, 2880, 2100, 1700, 1900, 1900, 2900, 2000))

df.new = pivot_longer(df, -clone, names_to = "condition", values_to = "titer")

df.multiple <- data.frame(clone =    rep(c("A", "B", "C", "D", "E", "F", "G", "H", "I", "J"),3),
                 titer =    rep(c(2300, 2100, 2900, 2400, 1900, 1850, 1750, 1600, 2700, 2200),3),
                 exp = rep(1:3, each = 10),
                 titer_mb = rep(c(2760, 2520, 3480, 2880, 2100, 1700, 1900, 1900, 2900, 2000),3))

df.multiple.new <- pivot_longer(df, -c(clone, exp), names_to = "condition", values_to = "titer")

source("ggplot2_personal_theme.R")

ggplot(df.new, aes(x = condition, y = titer/1000))+
  geom_boxplot(#lwd = 1,
               color = "#ffffff",
               fill = "#062C30")+
  geom_point(aes(color = clone), # use geom_jitter for multiple values for the same clone
             size = 3.0,
             shape = 21,
             stroke = 1,
             fill = "#062C30")+
  geom_hline(yintercept = 2.1, color = "#ffffff", linetype = "dashed", size = 0.5)+
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
       y = "\nTiter (mg/ml)\n",
       color = "Clones")+ # Change legend title, use fill or some other property used
  # Plot decoration
  shubham_theme_dark()
