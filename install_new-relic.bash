#!/bin/bash

# Check if script is being run with bash
[[ $_ != $0 ]] && sourced=1 || sourced=0
if [ $sourced -ne 1 ]; then
	echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
	echo "@@     PLEASE RUN SCRIPT WITH BASH!      @@"
	echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
	exit;
fi

# Add new-relic repo
echo 'deb http://apt.newrelic.com/debian/ newrelic non-free' | sudo tee /etc/apt/sources.list.d/newrelic.list

# Add new-relic repo key
wget -O- https://download.newrelic.com/548C16BF.gpg | sudo apt-key add -

# Update repos
sudo apt-get -y update

# Install new-relic
sudo apt-get -y install newrelic-sysmond #newrelic-php5

# fetch and add api key
source $PWD/setup.cnf # Load config file
if [[ -z "${newrelic_key// }" ]]; then
	echo
	echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
	echo "@@ NO NEW-RELIC KEY FOUND IN SETUP.CNF!  @@"
	echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
	echo "Please ensure a key is entered in setup.cnf and try again"
	echo
	exit
fi
sudo nrsysmond-config --set license_key=$newrelic_key

# Start new-relic service
#systemctl start newrelic-sysmond
sudo /etc/init.d/newrelic-sysmond start