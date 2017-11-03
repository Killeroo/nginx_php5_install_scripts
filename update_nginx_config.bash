#!/bin/bash

# Arguments check
if [ $# -ne 2 ]; then
    echo "USAGE: update_nginx_config.bash [field] [value]"
    exit;
fi

sed -i "s|$1 .*|$1 $2;|" /etc/nginx/conf.d/default.conf && echo "> \"$1 $2\" added to /etc/nginx/conf.d/default.conf"