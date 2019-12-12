#!/bin/bash

sudo dpkg --configure -a


#grab the github repo
sudo apt-get install git
sudo git clone https://github.com/CenterForSecureAndDependableSystems/CYOTEE.git

#install nginx
sudo apt-get install nginx -y

#install php
sudo apt-get install php-fpm php-mysql -y

#install MySQL
sudo apt-get install mysql-server -y

sudo cp CYOTEE/CYOTEE_Code/VulnerableCode/* /var/www/html/

sudo mv /var/www/html/default /etc/nginx/sites-available/default

sudo mysql -u root -e "DROP DATABASE test";
sudo mysql -u root -e "CREATE DATABASE test";

sudo mysql -u root -e "CREATE USER 'newuser'@'localhost' IDENTIFIED BY 'newpass'";
sudo mysql -u root -e "GRANT ALL PRIVILEGES ON test.* TO 'newuser'@'localhost'";

sudo mysql -u root test < CYOTEE/CYOTEE_Code/SQL/test.sql

sudo service nginx restart
