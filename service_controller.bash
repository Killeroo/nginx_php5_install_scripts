#!/bin/bash
# Used to control php and nginx services

# Arguments check
if [ $# -ne 2 ]; then
	echo "USAGE: service_controller.bash [ php | nginx | all ] [ start | stop | restart | reload ]";
	exit;
fi

# validate operator argument
operator="start"

if [ $1 = "php" ]; then
	echo "meow php"
	# sudo systemctl $operator php5.6-fpm
elif [ $1 = "nginx" ]; then
	echo " meow nginx"
	# sudo systemctl $operator nginx
elif [ $1 = "all" ]; then
	echo "meow all"
	# sudo systemctl $operator php5.6-fpm
	# sudo systemctl $operator nginx
else
	echo "UNKOWN ARGUMENT: Use either [ php | nginx | all ] "
	exit;
fi