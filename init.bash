#!/bin/bash
# Initialises a web app

# load config
source $PWD/setup.cnf

# Navigate to directory
cd /var/www/$site_name

# Stop services
sudo bash ./service_controller.bash all stop

# Git pull
git pull

# Run composer
composer install

# Start services
sudo bash ./service_controller.bash all start