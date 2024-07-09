#!/bin/bash 

 

# Set the target network range 

target_network="192.168.1.0/24" 

 

# Perform a ping scan to identify live hosts 

live_hosts=$(nmap -sn -oG - "$target_network" | awk '/Up/{print $2}') 

 

# Iterate over each live host 

for host in $live_hosts; do 

    echo "Scanning $host..." 

 

    # Perform a TCP connect scan and save the output to a file 

    nmap -sV -p- -oN "$host.nmap" "$host" 

 

    # Run vulnerability detection scripts 

    nmap --script=vuln "$host" -oN "$host.vuln" 

 

    # Run additional NSE scripts as needed 

    nmap --script=http-enum "$host" -oN "$host.http-enum" 

done