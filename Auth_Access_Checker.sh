#!/bin/bash



echo "[+]Important: The Current Directory is: /var/log/auth.log ."

echo "[+]if you want to continue with this directory press 1. if you want to change it press 2"

read path



case $path in

1 )

	

	FILE="/var/log/auth.log"



	#check if file exist

	if [ ! -f "$FILE" ]

	then 

		echo "File ${FILE} Not Found"

		exit 1

	fi

	echo "File Found"

	echo "IP: "

	read IP_ADDRESS



	# Check for successful logins

	echo "Successful logins from $IP_ADDRESS:"

	grep "$IP_ADDRESS" /var/log/auth.log | grep 'Accepted' | awk '{print $1,$2,$3}'



	# Check for failed logins

	echo "Failed logins from $IP_ADDRESS:"

	grep "$IP_ADDRESS" /var/log/auth.log | grep 'Failed' | awk '{print $1,$2,$3}'

	;;

2 )

	echo "PUT THE DIRECTORY OF THE AUTH.LOG FILE"

	read direc

	

	#check if file exist

	if [ ! -f "$direc" ]

	then 

		echo "File ${direc} Not Found"

		exit 1

	fi

	

	#check if file end with .log

	if [[ -f "$direc" && "$direc" != *.log ]]

	then 

	echo "Not a log file"

	exit 1 

	fi

	

	echo "File Found"

	echo "IP: "

	read IP_ADDRESS



	# Check for successful logins

	echo "Successful logins from $IP_ADDRESS:"

	grep "$IP_ADDRESS" /var/log/auth.log | grep 'Accepted' | awk '{print $1,$2,$3}'



	# Check for failed logins

	echo "Failed logins from $IP_ADDRESS:"

	grep "$IP_ADDRESS" /var/log/auth.log | grep 'Failed' | awk '{print $1,$2,$3}'

	;;

	

esac

