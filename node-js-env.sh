#/!bin/bash

# Script to create a development environment 
# and install nodejs and npm.

# Installing curl.
cd ~
sudo apt install curl

# Installing nodejs
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
sudo apt-get install -y nodejs

# Creating global directory for installations
#(check https://docs.npmjs.com/resolving-eacces-permissions-errors-when-installing-packages-globally)
mkdir ~/.npm-global

npm config set prefix '~/.npm-global'

touch ~/.profile

echo "export PATH=~/.npm-global/bin:$PATH" > ~/.profile

source ~/.profile

mkdir dev