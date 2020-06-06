#/!bin/bash

# Script to install my personal favourites programs on Ubuntu,
#created on the Ubuntu 18.04.14 LTS, by Lucas Guiss.

# Installing basic system utilities.
cd ~
sudo apt-get update -qq
sudo apt-get install 

# Getting OS information
OS=$(uname -m)
X64="64"

# Install the basic Ubuntu drivers.
sudo ubuntu-drivers autoinstall

cd /home/lucas/Downloads

# Installing Google Chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb

# Installing Spotify
if [[ $OS == *"$X64"* ]]
then
    wget http://repository.spotify.com/pool/non-free/s/spotify-client/spotify-client_1.0.47.13.gd8e05b1f-47_amd64.deb
    sudo dpkg -i spotify-client_1.0.47.13.gd8e05b1f-47_amd64.deb
else
    wget http://repository.spotify.com/pool/non-free/s/spotify-client/spotify-client_1.0.47.13.gd8e05b1f-16_i386.deb
    sudo dpkg -i spotify-client_1.0.47.13.gd8e05b1f-16_i386.deb
fi

# Installing Visual Studio Code
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /usr/share/keyrings/ && rm packages.microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt update && sudo apt install code

# Installing DBeaver
wget -O - https://dbeaver.io/debs/dbeaver.gpg.key | sudo apt-key add -
echo "deb https://dbeaver.io/debs/dbeaver-ce /" | sudo tee /etc/apt/sources.list.d/dbeaver.list
sudo apt-get update && sudo apt-get install dbeaver-ce

# Installing Intellij Ultimate
wget http://ppa.launchpad.net/ubuntuhandbook1/apps/ubuntu/pool/main/i/intellij-idea-ultimate/intellij-idea-ultimate_2017.3.2-1_all.deb -O intellij.deb
sudo dpkg -i intellij.deb
sudo apt-get install -f
sudo apt install ./intellij.deb --y

# Installing Insomnia
echo "deb https://dl.bintray.com/getinsomnia/Insomnia /" \  | sudo tee -a /etc/apt/sources.list.d/insomnia.list
wget --quiet -O - https://insomnia.rest/keys/debian-public.key.asc \  | sudo apt-key add -
sudo apt-get update
sudo apt-get install insomnia

echo '----------------------------DONE----------------------------'
echo '----------------------------REBOOTING SYSTEM----------------------------'
sudo reboot
