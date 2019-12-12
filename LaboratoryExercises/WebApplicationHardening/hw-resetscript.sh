#!/bin/bash

#grab the github repo
sudo apt-get remove git*
sudo apt-get purge git*
sudo rm -r CYOTEE

#install nginx
sudo apt-get remove nginx*
sudo apt-get purge nginx*


#install php
sudo apt-get remove php-fpm* php-mysql*
sudo apt-get purge php-fpm* php-mysql*

#install MySQL
sudo apt-get remove mysql-server*
sudo apt-get purge mysql-server*

sudo rm /var/www/html/*

