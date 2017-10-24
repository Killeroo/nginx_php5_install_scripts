#!/bin/bash

# Arguments check
if [ $# -ne 1 ]; then
	echo "Incorrect argument count:"
	echo "fetch_password [new-relic]"
	exit
fi

# Move down one folder
org_dir=$PWD #$(dirname $PWD)

# Check password.conf exists
if [ ! -f $org_dir/passwords.conf ]; then
	echo "***password.conf file could not be found***"
	echo "Please ensure this file exists in $PWD and try again"
	exit;
fi

# Fetch appropriate password
if [ $1 = "new-relic" ]; then
	grep 'new-relic_key=' $org_dir/passwords.conf | awk -F= '{ print  $2 }'
else
	echo "Unrecognised argument: Please use [new-relic]"
fi