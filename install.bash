#!/bin/bash

# Interupter check
[[ $_ != $0 ]] && sourced=1 || sourced=0
if [ $sourced -ne 1 ]; then
	echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
	echo "@@      PLEASE RUN SCRIPT WITH BASH      @@"
	echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
	exit;
fi

# Root check
if [[ $EUID -ne 0 ]]; then
	echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
	echo "@@        PLEASE RUN SCRIPT AS ROOT      @@"
	echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
	exit;
fi

# Check config file
config_status=$(bash check_config_file.bash)
if [ $config_status -eq 1 ]; then
    echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
	echo "@@           SETUP.CNF NOT FOUND!        @@"
	echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
    echo "Please ensure this file exists @ $PWD"
    echo "then try again."
    exit
elif [ $config_status -eq 2 ]; then
    echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
	echo "@@          SETUP.CNF IS EMPTY!          @@"
	echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
    echo "Please enter details into $PWD/setup.cnf"
    echo "then try again."
    exit;
fi
echo "-> Config file good"
source $PWD/setup.cnf

echo "-> Installing base packages..."
sudo bash ./install_base_packages.bash
echo "-> Updating nginx config..."
sudo bash ./update_nginx_config.bash server_name $site_name
sudo bash ./update_nginx_config.bash root /var/www/$site_name
echo "-> Installing new-relic..."
sudo bash ./install_new-relic.bash
echo "-> Creating account..."
sudo bash ./create_account.bash
echo "-> Cloning repository to /var/www/$site_name..."
sudo bash ./clone_repo.bash
echo "-> Starting services..."
sudo bash ./service_controller.bash all start
echo "-> Installation complete"

