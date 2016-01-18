#!/bin/bash

echo "==> 0 - add PPA of r"
# To obtain the latest R packages, See https://cran.r-project.org/mirrors.html for the list of CRAN mirrors.
echo "deb http://cran.csie.ntu.edu.tw/bin/linux/ubuntu trusty/"     | \
  sudo tee -a /etc/apt/sources.list
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E084DAB9


echo "==> 1 - install r-base"
sudo apt-get update
sudo apt-get install -y r-base libcurl4-openssl-dev libxml2-dev


echo "==> 2 - download and install r-studio-server"
# r-studio-server version = v0.99.491
sudo apt-get install -y gdebi-core
wget https://download2.rstudio.org/rstudio-server-0.99.491-amd64.deb
sudo gdebi -n rstudio-server-0.99.491-amd64.deb


echo "==> 3 - restart r-studio server"
# http://<server-ip>:8787
sudo rstudio-server restart
