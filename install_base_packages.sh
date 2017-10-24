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
sudo apt-get install -y nano git curl software-properties-common php-pear \
	build-essential libmcrypt-dev mysql-client apt-show-versions openssl

# Install php5
sudo add-apt-repository ppa:ondrej/php
sudo apt-get update -y
sudo apt-get install -y php5-fpm php5-curl php5-mcrypt php5-gd \
	php5-imagick php5-mysql

# Install nginx
add-apt-repository 'deb http://nginx.org/packages/ubuntu/ trusty nginx'
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys $key
apt-get update -y
apt-get install -y nginx

# Create account and login
sudo adduser --system --home /home/$user --disabled-password --shell /bin/bash $user
(echo $password; echo $password; ) | sudo passwd $user
sudo usermod -aG sudo $user
sudo su - $user