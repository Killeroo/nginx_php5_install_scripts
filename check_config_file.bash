#!/bin/bash
# checks integrity of config file
# Based off: http://wiki.bash-hackers.org/howto/conffile

# Check config file exists
if [ ! -f setup.cnf ]; then
	echo 1
	exit;
fi

# Check key fields arent empty
source $PWD/setup.cnf
if [ -z $account_name ]; then
    echo 2 && exit;
elif [ -z $account_password ]; then
    echo 2 && exit;
elif [ -z $site_name ]; then
    echo 2 && exit;
fi

# config file is good
echo 0;