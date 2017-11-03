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

# clone repo
git clone $repo

# switch back to original directory
cd $orig_dir