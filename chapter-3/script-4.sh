#!/bin/bash

while read -r ip; do 
   echo "Starting Nmap scan on $ip" 
   nmap -sV -Pn $ip  
done < targets.txt 