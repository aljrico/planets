library(rvest)
library(xml2)
library(tidyverse)
url <- 'https://en.wikipedia.org/wiki/List_of_exoplanets_(full)'
webpage <- read_html(url)


table <- url %>%
  read_html() %>%
  html_nodes(xpath='//*[@id="mw-content-text"]/div/table') %>%
  html_table() %>%
  .[[1]]


numeric_cols <- c('Radius (RJ)', 'Period (days)', 'Semi-major axis (AU)', 'Temp. (K)[1]', 'Disc. Year', 'Distance (ly)', 'Host star mass (M☉)', 'Host star temp. (K)')

for(c in numeric_cols) table[[c]] <- as.numeric(table[[c]])
cols <- colnames(table)


cols[[which(cols == "Temp. (K)[1]")]] <- 'Temperature (K)'
cols[[which(cols == 'Host star mass (M☉)')]] <- 'Host Star Mass'

colnames(table) <- cols

planets <- table
