#!/bin/bash

sudo apt-get install maven

# Install NVM
sudo apt-get install build-essential
sudo apt-get install libssl-dev
wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.33.4/install.sh | bash
nvm install 8.10.0
nvm use 8.10.0
nvm alias default 8.10.0
# sudo npm install -g npm@latest
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt-get update && sudo apt-get install yarn

# You need to install PM2
npm install -g pm2
mkdir /home/$USER/.pm2
sudo chown $USER:$USER -R /home/$USER/.pm2

# You need to install Redis
sudo apt-get -qq -y install redis-server
echo "maxmemory 1024mb" | sudo tee --append /etc/redis/redis.conf
echo "maxmemory-policy allkeys-lru" | sudo tee --append /etc/redis/redis.conf
sudo systemctl enable redis-server.service