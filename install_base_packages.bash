#!/bin/bash

# Get basic packages 
sudo apt-get update -y
sudo apt-get install -y nano git curl software-properties-common php-pear \
	build-essential libmcrypt-dev mysql-client apt-show-versions openssl

# Install php5
sudo add-apt-repository ppa:ondrej/php
sudo apt-get update -y
sudo apt-get install -y php5.6-fpm php5.6-curl php5.6-mcrypt php5.6-gd \
	php5.6-imagick php5.6-mysql

# Install nginx
sudo add-apt-repository ppa:ondrej/nginx #'deb http://nginx.org/packages/ubuntu/ trusty nginx'
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys $key
sudo apt-get update -y
sudo apt-get install -y nginx

# Move nginx cnfig
sudo mv vhost.cnf /etc/nginx/cnf.d/default.cnf

# cnfigure firewall
sudo ufw allow 'Nginx Full'
sudo ufw allow 22/tcp
sudo ufw enable