#!/bin/sh

# Import gloabl files
source ../global.sh
bash ../global.sh

echo -e "${Yellow}Nginx Installing............${End}"
sudo apt-get update
sudo apt install nginx -y

echo -e "${Yellow}Adjusting the Firewall${End}"
sudo ufw app list
sudo ufw allow 'Nginx HTTP'
sudo ufw status
echo -e "${Green}Ngnix installed${End}"