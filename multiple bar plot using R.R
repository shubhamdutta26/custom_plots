# load libraries
library(ggplot2)
library(showtext)
font_add_google(name = "Source Sans Pro", family = "SourceSansPro")
showtext_auto()

source("ggplot2_personal_theme.R")
shubham_palette_dark <- c("#65C18C", "#FF6363", "#BAFFB4", "#CAB8FF", "#ffe119","#edad08", "#73af48", "#8E9CA3", "#f032e6", "#ff7c05", "#38a6a5", "#424b54")

#input details
experiment <- rep(c("experiment 1","experiment 2"), each = 5)
condition <- rep(c("no block","BioRad block","aZIKA 5ul","aZIKA 10ul","aZIKA 15ul"), 2)
data <- c(90,80,70,60,50,88,72,61,44,18)
#sd <- c(4.459,3.919,2.657,2.765,2.513,4.459,3.919,2.657,2.765,2.513)
df <- data.frame(experiment,condition,data)#,sd)

# Plot bar graph
ggplot(data = df, aes(x = condition, y=data))+
  geom_bar(aes(color = experiment), stat="identity", fill="#062C30", width=0.5, position=position_dodge(width = 0.7))+
  # Error bars
  # geom_errorbar(aes(ymin=data-sd, ymax=data+sd), width=.2, position=position_dodge(.9))+
  # Modify y axis
  # scale_y_continuous(breaks = seq(0, 100, 10), limits=c(0, 100),  expand = c(0, 0))+
  # Disable data sorting by R
  scale_x_discrete(limits = c("no block","BioRad block","aZIKA 5ul","aZIKA 10ul","aZIKA 15ul"))+
  scale_color_manual(values = shubham_palette_dark) +
  # Legends
  labs(title = "Comparison of blocking reagents in owl monkey PBMCs",
       subtitle = "Data generated on xxx",
       caption = "Shubham Dutta",
       color = "Experiment set",
       x = "blocking reagents",
       y = "% PE-Cy7 positive cells in lymphocytes")+
  shubham_theme_dark()
