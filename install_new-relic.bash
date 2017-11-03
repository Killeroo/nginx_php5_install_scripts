#!/bin/bash

# Check if script is being run with bash
[[ $_ != $0 ]] && sourced=1 || sourced=0
if [ $sourced -ne 1 ]; then
	echo "Please use 'bash install_new-relic.sh to run the script"
	exit;
fi

# Add new-relic repo
echo 'deb http://apt.newrelic.com/debian/ newrelic non-free' | sudo tee /etc/apt/sources.list.d/newrelic.list

# Add new-relic repo key
wget -O- https://download.newrelic.com/548C16BF.gpg | sudo apt-key add -

# Update repos
sudo apt-get -y update

# Install new-relic
sudo apt-get -y install newrelic-sysmond newrelic-php5

# fetch and add api key
key=$(bash $PWD/query_config_file.bash new-relic)
if [[ -z "${key// }" ]]; then
	echo
	echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
	echo "@@ NO NEW-RELIC KEY FOUND IN SETUP.CONF! @@"
	echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
	echo "Please ensure a key is entered in setup.conf and try again"
	exit
fi
sudo nrsysmond-config --set license_key=$key

# Start new-relic service
#systemctl start newrelic-sysmond
sudo /etc/init.d/newrelic-sysmond start