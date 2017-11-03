#!/bin/bash

# Arguments check
if [ $# -ne 1 ]; then
	echo "USAGE: query_config_file.bash [ new-relic | username | password | sitename ]"
	exit
fi

# Move down one folder
org_dir=$PWD #$(dirname $PWD)

# Check setup.conf exists
if [ ! -f $org_dir/setup.conf ]; then
	echo
	echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
	echo "@@ SETUP.CONF COULD NOT BE FOUND! @@"
	echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
	echo "Please ensure this file exists in $PWD and try again"
	exit;
fi

# Fetch appropriate setting
if [ $1 = "new-relic" ]; then
	grep 'new-relic_key=' $org_dir/setup.conf | awk -F= '{ print  $2 }'
elif [ $1 = "username" ]; then
	grep 'account_name=' $org_dir/setup.conf | awk -F= '{ print  $2 }'
elif [ $1 = "password" ]; then
	grep 'account_password=' $org_dir/setup.conf | awk -F= '{ print  $2 }'
elif [ $1 = "sitename" ]; then
	grep 'site_name=' $org_dir/setup.conf | awk -F= '{ print  $2 }'
else
	echo "Unrecognised argument: Please use [ new-relic | username | password | sitename ]"
fi