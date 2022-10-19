#!/bin/sh

# Import gloabl files
source ../global.sh
bash ../global.sh

echo -e "${Yellow}Apache2 Installing............${End}"
sudo apt-get update
sudo apt install apache2 -y

echo -e "${Yellow}Adjusting the Firewall${End}"
sudo ufw app list
sudo ufw allow 'Apache'
sudo ufw status
echo -e "${Green}Apache2 installed${End}"