#!/bin/bash

#overhead
sudo apt-get remove git*
sudo apt-get purge git*
sudo apt-get remove openssh-server* openssh-client*
sudo apt-get purge openssh-server* openssh-client*

#remove github repo
sudo rm -r CYOTEE

#create users
sudo userdel redteam
sudo userdel guest

#disable auto-updates
sudo rm /etc/apt/apt.conf.d/20-auto-upgrades
sudo rm /etc/apt/apt.conf.d/20auto-upgrades

#add a couple of cron jobs
sudo crontab -r
