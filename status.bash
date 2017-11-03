#!/bin/bash

echo
echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
echo "@@           NGINX STATUS            @@"
echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
sudo systemctl status nginx

echo
echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
echo "@@            PHP STATUS             @@"
echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
sudo systemctl status php5.6-fpm

echo 
echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
echo "@@          FIREWALL STATUS          @@"
echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
sudo ufw status

echo
echo "Versions:"
echo "-------------------"
nginx -v
echo "-------------------"
php --version 
echo "-------------------"

address=$(curl -4 icanhazip.com)
echo
echo "Server's public address is: $address"