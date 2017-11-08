#!/bin/bash

# Get basic packages 
sudo apt-get update -y
sudo apt-get install -y nano git curl software-properties-common php-pear \
	build-essential libmcrypt-dev mysql-client apt-show-versions openssl expect

# Install php5
expect -c "
spawn sudo add-apt-repository ppa:ondrej/php
expect -nocase \"*to continue or ctrl-c to cancel adding it\" {send \"\r\"; interact}
"
sudo apt-get update -y
sudo apt-get install -y php5.6-fpm php5.6-curl php5.6-mcrypt php5.6-gd \
	php5.6-imagick php5.6-mysql

# Install nginx
expect -c "
spawn sudo add-apt-repository ppa:ondrej/nginx
expect -nocase \"*to continue or ctrl-c to cancel adding it\" {send \"\r\"; interact}
"
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys $key
sudo apt-get update -y
sudo apt-get install -y nginx
sudo apt-get clean

# Move nginx config
sudo mv vhost.conf /etc/nginx/conf.d/default.conf

# Synlink to /etc/nginx/sites_enabled
ln -s /etc/nginx/conf.d/default.conf /etc/nginx/sites-enabled

# cnfigure firewall
expect -c "
spawn sudo ufw enable
expect -nocase \"Command may disrupt existing ssh connections. Proceed with operation (y|n)?\" {send \"y\r\"; interact}
"
sudo ufw allow 'Nginx Full'
sudo ufw allow 22/tcp