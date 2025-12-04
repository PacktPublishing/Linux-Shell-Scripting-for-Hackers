#!/bin/bash 
# generate_passwords.sh - Generates a list of random passwords 
for i in {1..5}; do 
    tr -dc A-Za-z0-9 </dev/urandom | head -c 12 
    echo 
done 
