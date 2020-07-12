#/!bin/bash

# Script to install my personal favourites programs on Linux.

# Installing basic system utilities.
cd ~
sudo apt-get update -qq
sudo apt-get install 

# Getting OS information
OS=$(uname -m)
X64="64"

cd Downloads/

# Installing Google Chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install ./google-chrome-stable_current_amd64.deb -y

# Installing Spotify
sudo sh -c "echo 'deb http://repository.spotify.com stable non-free' >> /etc/apt/sources.list.d/spotify.list"
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 931FF8E79F0876134EDDBDCCA87FF9DF48BF1C90
sudo apt-get update
sudo apt-get install spotify-client

if [[ $OS == *"$X64"* ]]
then
    # Installing DBeaver
    wget -c https://dbeaver.io/files/6.0.0/dbeaver-ce_6.0.0_amd64.deb
    sudo dpkg -i dbeaver-ce_6.0.0_amd64.deb
    sudo apt-get install -f
else
    # Installing DBeaver
    wget -c https://dbeaver.io/files/6.0.0/dbeaver-ce_6.0.0_i386.deb
    sudo dpkg -i dbeaver-ce_6.0.0_i386.deb
    sudo apt-get install -f
fi

# Installing Visual Studio Code
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
sudo apt update
sudo apt install code

# Installing GIT
sudo apt-get install git -y

# Installing Insomnia
echo "deb https://dl.bintray.com/getinsomnia/Insomnia /" \  | sudo tee -a /etc/apt/sources.list.d/insomnia.list
wget --quiet -O - https://insomnia.rest/keys/debian-public.key.asc \  | sudo apt-key add -
sudo apt-get update
sudo apt-get install insomnia

echo '----------------------------DONE----------------------------'
echo '----------------------------REBOOTING SYSTEM----------------------------'
sudo reboot
