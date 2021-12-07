# BIS 244 - Assignment 05 Starter

library(tidyverse)
library(ggthemes)
library(RColorBrewer)

# Clear out Console and Environment
rm(list=ls(all=TRUE))
cat("\014")

tonnage <- read.csv("TBQ05.20211116133909.csv")
str(tonnage)

tonnage$VALUE <- as.numeric(tonnage$VALUE)
tonnage$VALUE[is.na(tonnage$VALUE)] <- 0
tonnage$Region.of.Trade <- as.factor(tonnage$Region.of.Trade)


tonnage<-tonnage[which(tonnage$Port!="All Main Irish Ports" &
                         tonnage$C01713V02044 =="1"),]

p <- ggplot(data=tonnage) + 
  geom_point(aes(x=Quarter,y=VALUE, color=Port)) + 
  ggtitle("Quarterly Tonnage Arriving From Great Britain and Northern Ireland") + 
  xlab("Quarter") + 
  ylab("Tonnage") +
  theme_minimal()

if (!require("ggthemes")) install.packages("ggthemes")
ls(pattern = '^theme_' , env = as.environment('package:ggthemes'))
theme_set(theme_wsj())
p + theme(legend.position="top")
p + scale_color_brewer(palette ="Greens") +
theme(legend.position ="top")
