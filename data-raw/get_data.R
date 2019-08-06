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



df <- read.csv('https://exoplanetarchive.ipac.caltech.edu/cgi-bin/nstedAPI/nph-nstedAPI?table=exoplanets')
df %>% glimpse()


"
https://exoplanetarchive.ipac.caltech.edu/cgi-bin/nstedAPI/nph-nstedAPI?table=exoplanets&format=ipac&where=pl_name like 'BD%2B20 594 b'
"


key <- "kj08EO0tadcCIsMSaJjO250UDYGAkdqapXwgxTHs"
img <- earth_image(key, -100.31008, 25.66779, "2016-01-01")

