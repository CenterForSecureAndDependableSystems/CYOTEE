#!/bin/bash

#overhead
sudo dpkg --configure -a
sudo apt-get install git -y
sudo apt-get install openssh-server openssh-client -y
sudo service ssh start
sudo rm -r CYOTEE
sudo git clone https://github.com/CenterForSecureAndDependableSystems/CYOTEE.git

#create users
useradd redteam
useradd guest

#assign passwords to the users
sudo echo -e "redteam\nredteam" | passwd redteam
sudo echo -e "guest\nguest" | passwd guest

#disable auto-updates
sudo rm /etc/apt/apt.conf.d/20-auto-upgrades
sudo rm /etc/apt/apt.conf.d/20auto-upgrades
sudo cp CYOTEE/CYOTEE_Code_Linux/20-auto-upgrades /etc/apt/apt.conf.d/20-auto-upgrades

#add a couple of cron jobs

sudo crontab -u thesis -l | { cat; echo "* * * * * touch ~/Desktop/sensitivefile"; } | crontab - -u thesis
sudo crontab -u thesis -l | { cat; echo "*/2 * * * * rm  ~/Desktop/sensitivefile"; } | crontab - -u thesis
