#!/bin/bash

# Checking your Ubuntu version
# lsb_release -a

echo "Install Java on Ubuntu"
sudo apt-get install default-jre
sudo apt-get install default-jdk

echo "Install Jenkins on Ubuntu"
wget -q -O - https://pkg.jenkins.io/debian/jenkins-ci.org.key | sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt-get update
sudo apt-get install jenkins

# If you would like to start/stop/restart jenkins and all of services
# sudo service jenkins start/stop/restart

# Configuring Webhook To Jenkins for Bitbucket
# https://mohamicorp.atlassian.net/wiki/spaces/DOC/pages/121274372/Configuring+Webhook+To+Jenkins+for+Bitbucket
# 
# Install JHipster
# Installing Node.js via package manager
# https://nodejs.org/en/download/package-manager/
#sudo apt-get install gcc g++ make
#curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
#sudo apt-get install -y nodejs
#nodejs --version

#curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
#echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
#sudo apt-get update && sudo apt-get install yarn

#sudo apt-get install git-core

# Test Your API
#sudo npm install -g electron --unsafe-perm=true
#sudo npm install -g dredd
#dredd init -r apiary -j apiaryApiKey:fc2c5f05ec6ed3331355b3465a7d651a -j
read -e -p "Is this tenant a child tenant? [y/n] " -i "y" isChildTenant

if [ "$isChildTenant" = "y"  ]; then
	echo -ne "Name of parent tenant: "
	read parentTenantId
	echogreen "Creating new tenant..."
	curl -G localhost:8300/eform/tenant/$tenantId?parentTenant=$parentTenantId
else
	echogreen "Creating new tenant..."
	curl -G localhost:8300/eform/tenant/$tenantId
fi
