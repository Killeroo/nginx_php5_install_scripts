#!/bin/bash

# load config
source $PWD/setup.cnf

if [[ -z "${repo// }" ]]; then
    echo
	echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
	echo "@@  NO REPO URL KEY FOUND IN SETUP.CNF!  @@"
	echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
	echo "Please ensure a repository address is entered"
    echo "in setup.cnf and try again."
	exit
fi

# Save original directory
orig_dir=$PWD

# Switch to webroot
cd /var/www/

# Create new dir for site
mkdir $site_name
cd $site_name

# clone repo
git clone $repo /var/www/$site_name

# Alter ownership and permissions
sudo chown -R $account_name:www-data /var/www/ 
sudo chmod -R 755 /var/www/

# Setup temp dirs
mkdir /var/www/$site_name/system/logs
mkdir /var/www/$site_name/system/cache
sudo chmod -R 775 /var/www/$site_name/system/logs
sudo chmod -R 775 /var/www/$site_name/system/cache

# switch back to original directory
cd $orig_dir