#!/bin/bash

# Reset the variables
username=""
password=""
ip_address=""

# Process the arguments
while [[ $# -gt 0 ]]; do
    if [[ -z "$username" ]]; then
        username="$1"
        shift
    elif [[ -z "$password" ]]; then
        password="$1"
        shift
    else
        ip_address="$1"
        shift
    fi
done

echo "Username: $username"
echo "Password: $password"
echo "IP Address: $ip_address"
