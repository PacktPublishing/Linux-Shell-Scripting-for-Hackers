#!/bin/bash 

target_ip="192.168.52.102" 
echo "Starting Nmap scan on $target_ip..." 
nmap -p- -sV $target_ip -oN metasploitable_scan.txt 
echo "Scan complete. Results saved in metasploitable_scan.txt." 