#!/bin/bash 

 

# Set the target network range 

target_network="10.0.0.0/24" 

 

# Perform a TCP SYN scan to identify hosts with open ports 

open_ports=$(nmap -sS -oG - "$target_network" | awk '/open/{print $2}') 

 

# Iterate over each host with open ports 

for host in $open_ports; do 

    echo "Scanning $host..." 

 

    # Check for web servers on common ports 

    nmap -p80,8080,443 --script=http-title "$host" -oN "$host.web" 

 

    # Run scripts to detect vulnerable web applications 

    nmap -p80,8080,443 --script=http-vuln-cve* "$host" -oN "$host.web-vuln" 

done 