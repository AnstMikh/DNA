setwd("/Users/Anst2/OneDrive/Desktop/chili/d-statistics")
library('tidyverse')
library("ggplot2")
library("readr")
result <- read_table2("./log2.txt")

#if you use rstudio then you should save picture 
#with the width equals 1500pt and the height equals 900pt

ggplot(result, aes(fct_reorder(X, D), D, color = abs(Zscore) > 2)) +
  geom_point()  + theme_light() +
  geom_hline(yintercept = 0, linetype = 2) +
  geom_errorbar(aes(ymin = D - 2 * D / Zscore, ymax = D + 2 * D / Zscore)) +
  theme(axis.text.x = element_text(angle = 90, hjust=1, vjust=1))
