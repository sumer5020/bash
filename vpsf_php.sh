#!/bin/bash
if [ $UID != 0 ]
then
	echo "Your are not root"
	exit
fi
echo "Starting..."
sudo apt upgrade

sudo apt install ca-certificates apt-transport-https
wget -q https://packages.sury.org/php/apt.gpg -O- | sudo apt-key
echo "deb https://packages.sury.org/php/ stretch main" | sudo tee
sudo apt update
sudo apt install php7.4
sudo apt install php7.4-cli php7.4-common php7.4-curl php7.4-mbst
sudo apt install php7.4-soap php7.4-zip php7.4-intl php7.4-opcache php7.4-imap php7.4-dev php7.4-mysql