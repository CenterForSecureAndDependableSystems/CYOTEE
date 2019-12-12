#!/bin/bash

sudo dpkg --configure -a

#install git
sudo apt-get install git -y;

#remove existing repo and clone git repo
sudo rm -r CDCTE2
sudo git clone https://github.com/CenterForSecureAndDependableSystems/CYOTEE.git

#install MySQL 
sudo apt-get install -y mysql-server;

#create the MySQL users
sudo mysql -u root -e "CREATE USER 'randomuser'@'localhost' IDENTIFIED BY 'password'";
sudo mysql -u root -e "CREATE USER 'redteamer'@'localhost' IDENTIFIED BY 'redteam'";
sudo mysql -u root -e "CREATE USER 'haxxor'@'localhost' IDENTIFIED BY 'haxxor'";

#create the unnecessary database
sudo mysql -u root -e "CREATE DATABASE dontlook";

#remove the vulnerable database if one already exists
sudo mysql -u root -e "DROP DATABASE vulndb";

#create the vulnerable database
sudo mysql -u root -e "CREATE DATABASE vulndb";

#grant all privileges to root
sudo mysql -u root -e "GRANT ALL PRIVILEGES ON vulndb.* TO 'root'@'localhost'";

#import vulndb sql file
sudo mysql -u root vulndb < CYOTEE/CYOTEE_Code/SQL/vulndb.sql;
