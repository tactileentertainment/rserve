# Dotcloud ubuntu image
FROM ubuntu:latest
MAINTAINER paoloburelli

# Install latest R
RUN echo "deb http://cran.rstudio.com/bin/linux/ubuntu trusty/" >> /etc/apt/sources.list
# add the public keys:
RUN gpg --keyserver keyserver.ubuntu.com --recv-key E084DAB9
RUN gpg -a --export E084DAB9 | apt-key add -
  
# Update and install
RUN apt-get update && apt-get install -y \
  r-base \
  r-recommended \
  r-base-dev \
  libcurl4-gnutls-dev \
  libxml2-dev \
  libmime-base64-urlsafe-perl \
  libdigest-hmac-perl \
  libdigest-sha-perl \
  libssl-dev \
  libapparmor1 \
  libpq-dev \
  wget

# log R version
RUN R --version

#install R packages
RUN R -e "install.packages(c('Rserve','Rmisc','Rmisc','signal','foreach','doParallel','RJSONIO','stringr', 'zoo', 'parallel','pracma','rjson','gdata','nnet','RPostgreSQL','reshape'), repos='http://cran.r-project.org')"

# Add rserve user
RUN groupadd -r rserve && useradd -r -g rserve rserve

# adding start R script
ADD start.R start.R
ADD Rserv.conf /Rserv.conf
EXPOSE 6311
CMD Rscript /start.R

# Create app directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# Bundle app source
# COPY *.R *.r /usr/src/app/
