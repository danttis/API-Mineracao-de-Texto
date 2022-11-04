FROM rocker/r-ver:4.0.0

RUN apt-get update -qq && apt-get install -y \
	libssl-dev \
	libcurl4-gnutls-dev \
	libxml2-dev 

RUN R -e "install.packages(c('plumber','tm','textreadr'), dependencies=TRUE)"

COPY API.R scraping.R ./

EXPOSE 8080

ENTRYPOINT ["R", "-e", "source('API.R')"]

