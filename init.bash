#!/bin/bash
# Initialises a web app

# load config
source $PWD/setup.cnf

# Stop services
sudo bash ./service_controller.bash all stop

# Navigate to directory
orig_dir=$PWD
cd /var/www/$site_name

# Stop services
sudo bash ./service_controller.bash all stop

# Git pull
git pull

# Run composer
composer install

# Configure donate scripts

# Switch back to original dir
cd $orig_dir

# Start services
sudo bash ./service_controller.bash all start