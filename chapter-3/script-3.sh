#!/bin/bash

read -p "Enter port number (1-65535): " port

if [[ "$port" =~ ^[0-9]+$ ]] && (( port >= 1 && port <= 65535 )); then
    echo "Valid port number."
else
    echo "Invalid port. Please try again."
fi
