#!/bin/bash

# Check config file exists
if [ ! -f setup.conf ]; then
	echo 1
	exit;
fi

# Check key fields arent empty
grep 'site_name=' $PWD/setup.conf | awk -F= '{ print  $2 }'
if [[ -z "${2// }" ]]; then
    echo 2;
    exit;
fi
grep 'account_name=' $org_dir/setup.conf | awk -F= '{ print  $2 }'
if [[ -z "${2// }" ]]; then
    echo 2;
    exit;
fi
grep 'account_password=' $org_dir/setup.conf | awk -F= '{ print  $2 }'
if [[ -z "${2// }" ]]; then
    echo 2;
    exit;
fi

echo 0;