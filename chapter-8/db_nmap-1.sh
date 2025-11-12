#!/bin/bash
ipaddresses=("$@")

if [[ -z "$@" ]]; then
	echo "You need to enter at least one IP address for your target machine(s)."
	exit 1
fi

msfconsole -q -x "workspace -a pentesting_2; \
	db_nmap -A --script=vulners $(echo "${ipaddresses[@]}"); \
	hosts; \
	services; \
	vulns; \
	exit"
	
