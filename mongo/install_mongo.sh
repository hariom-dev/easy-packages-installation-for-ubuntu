#!/bin/sh

# Import gloabl files
source ../global.sh
bash ../global.sh

# Install MongoDB Community Edition
echo -e "${Yellow}Start install Mongo${End}"
wget -qO - https://www.mongodb.org/static/pgp/server-6.0.asc | sudo apt-key add -
sudo apt-get install gnupg
wget -qO - https://www.mongodb.org/static/pgp/server-6.0.asc | sudo apt-key add -

if [[ $(lsb_release -rs) == "20.04" ]]; then

    echo " deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/6.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-6.0.list

elif [[$(lsb_release -rs) == "18.04"]]; then
    echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu bionic/mongodb-org/6.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-6.0.list

elif [[$(lsb_release -rs) == "16.04"]]; then
    echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu bionic/mongodb-org/6.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-6.0.list

else
    echo -e "${Red}Can't install mongo DB cause os is compatible.${End}"
fi

sudo apt-get update
sudo apt-get install -y mongodb-org

echo -e "${Green}mongodb-org hold${end}" | sudo dpkg --set-selections
echo -e "${Green}mongodb-org-database hold${end}" | sudo dpkg --set-selections
echo -e "${Green}mongodb-org-server hold${end}" | sudo dpkg --set-selections
echo -e "${Green}mongodb-mongosh hold${end}" | sudo dpkg --set-selections
echo -e "${Green}mongodb-org-mongos hold${end}" | sudo dpkg --set-selections
echo -e "${Green}mongodb-org-tools hold${end}" | sudo dpkg --set-selections

sudo service mongod start
sudo service mongod status
