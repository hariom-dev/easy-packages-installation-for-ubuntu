#!/bin/sh

# Import gloabl files
source ../global.sh
bash ../global.sh

echo -e "${Yellow}Install docker compose start............${End}"

sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose --version

echo -e "${Green}Complete${End}"

