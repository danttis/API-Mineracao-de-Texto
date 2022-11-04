library(plumber)
library(tm)
library(textreadr)

API <- plumb('scraping.R')

API$run(host = '0.0.0.0',
        port = 8080,
        swagger = T)
