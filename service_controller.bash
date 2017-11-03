#!/bin/bash
# Used to control php and nginx services

# Arguments check
if [ $# -ne 2 ]; then
	echo "USAGE: service_controller.bash [ php | nginx | all ] [ start | stop | restart | reload ]";
	exit;
fi

# Validate operator argument
valid_operators=( "start" "stop" "restart" "reload" )
if [[ " ${valid_operators[*]} " == *" $2 "* ]]; then
	operator=$2
else
	echo "UNKOWN ARGUMENT: Use either [ start | stop | restart | reload ] "
	exit
fi

# Perform service operation
if [ $1 = "php" ]; then
	sudo systemctl $operator php5.6-fpm
elif [ $1 = "nginx" ]; then
	sudo systemctl $operator nginx
elif [ $1 = "all" ]; then
	sudo systemctl $operator php5.6-fpm
	sudo systemctl $operator nginx
else
	echo "UNKOWN ARGUMENT: Use either [ php | nginx | all ] "
	exit;
fi

echo
echo "Service [$1] told to [$2]..."
echo