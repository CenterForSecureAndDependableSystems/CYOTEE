#!/bin/bash

#install git
sudo apt-get remove git*
sudo apt-get purge git*

#remove existing repo and clone git repo
sudo rm -r CDCTE2

#install MySQL 
sudo apt-get remove mysql-server*
sudo apt-get purge mysql-server*

