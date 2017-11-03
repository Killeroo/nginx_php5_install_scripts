#!/bin/bash

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
elif [ $config_status -eq 0 ]; then
    echo "-> Config file good"
fi

echo "-> Installing base packages..."
sudo bash ./install_bash_packages.bash
echo "-> Updating nginx config..."

echo "-> Installing new-relic..."
sudo bash ./install_new-relic.bash
echo "-> Creating account..."
sudo bash ./create_account.bash
echo "-> Cloning repository to /var/www..."
#sudo bash ./clone_repo.bash
echo "-> Starting services..."
#sudo bash ./service_controller.bash

