#!/bin/bash
if [[ $1 == "" ]] ; then
	echo "You must specify a user name."
	echo "Usage: sudo ./user_activity_1.sh username "
	exit
fi

timestamp="$(date +"%F_%H-%M")"
username=$1

if [[ -f /var/log/secure ]] ; then
	logfile=/var/log/secure
elif [[ -f /var/log/auth.log ]] ; then
	logfile=/var/log/auth.log
elif [[ -n $(awk /suse/ /etc/os-release) ]] ; then
	logfile=/var/log/messages
elif [[ -n $(awk /openmandriva/ /etc/os-release) ]] ; then
	logfile=/var/log/sudo.log
else
	echo "I don't know this operating system."
	exit
fi

echo "=== User Account Activity ===" > user_activity_for_"$username"_"$timestamp".txt

# Check user activity in system logs
echo "=== Recent Logins ===" >> user_activity_for_"$username"_"$timestamp".txt
last | grep $username >> user_activity_for_"$username"_"$timestamp".txt

# Check sudo command usage
echo "=== Sudo Command Usage ===" >> user_activity_for_"$username"_"$timestamp".txt
if [[ -n $(awk /openmandriva/ /etc/os-release) ]] ; then
	grep "$username" "$logfile" >> user_activity_for_"$username"_"$timestamp".txt
else
	grep sudo "$logfile" | grep "$username" >> user_activity_for_"$username"_"$timestamp".txt
fi
