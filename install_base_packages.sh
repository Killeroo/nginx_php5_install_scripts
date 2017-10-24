#!/bin/bash

# Arguments check
if [ $# -ne 2 ]; then
	echo "Not enough arguments: script [username] [password]";
	exit;
else
	user=$1
	password=$2
fi

# Get basic packages 
sudo apt-get update -y
sudo apt-get install -y nano git software-properties-common \
	libmcrypt-dev mysql-client


	
# Create account and login
sudo adduser --system --home /home/$user --disabled-password --shell /bin/bash $user
(echo $password; echo $password; ) | sudo passwd $user
sudo usermod -aG sudo $user
sudo su - $user