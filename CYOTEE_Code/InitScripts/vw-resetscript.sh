#!/bin/bash


sudo apt-get remove nginx*
sudo apt-get purge nginx*

sudo apt-get remove php-fpm* php-mysql*
sudo apt-get purge php-fpm* php-mysql*

sudo apt-get remove mysql-server*
sudo apt-get purge mysql-server*
