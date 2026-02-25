#!/bin/bash
# Run nmap scan
nmap -oG nmap_scan.txt 192.168.1.0/24
# Extract open ports using grep and awk
grep "/open/" nmap_scan.txt | awk '{print $2, $3}' > 
open_ports.txt
echo "Open ports extracted to open_ports.txt"
