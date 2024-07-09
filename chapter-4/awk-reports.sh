#!/bin/bash 

 

# Perform nmap scan and store output 

nmap_output=$(nmap -oX - -p- -sV 192.168.1.0/24) 

 

# Extract relevant information 

open_ports=$(echo "$nmap_output" | xmllint --format - | awk -F'[<>]' '/<port/{print $5}') 

services=$(echo "$nmap_output" | xmllint --format - | awk -F'[<>]' '/<service/{print $7}') 

 

# Generate report 

echo "Network Scan Report" > report.txt 

echo "-------------------" >> report.txt 

echo "Date: $(date)" >> report.txt 

echo "Network: 192.168.1.0/24" >> report.txt 

echo "" >> report.txt 

echo "Open Ports and Services:" >> report.txt 

paste <(echo "$open_ports") <(echo "$services") | sed 's/\\t/:  /' >> report.txt 