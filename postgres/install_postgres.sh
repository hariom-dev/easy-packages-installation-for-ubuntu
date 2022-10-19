#!/bin/sh

# Import gloabl files
source ../global.sh
bash ../global.sh


echo -e "${Yellow}Install Postgres sql..........${End}"
sudo apt-get update
sudo apt install postgresql postgresql-contrib -y
sudo systemctl start postgresql.service
echo -e "${Green}Installed ${End}"

echo -e "${Yellow}Create sample DB and User${End}"
sudo su postgres bash -c "psql < setup.sql"
echo -e "${Green}Created${End}"
echo -e "${Blue}User${End} -- ${White}root${End}"
echo -e "${Blue}Pass${End} -- ${White}root${End}"

