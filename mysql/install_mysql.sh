#!/bin/sh

# Import gloabl files
source ../global.sh
bash ../global.sh

echo -e "${Yellow}Install Mysql...${End}"
sudo apt update
sudo apt install mysql-server -y
sudo systemctl start mysql.service

# sudo mysql < setup.sql

echo -e "${Green}Installed Mysql${End}"
