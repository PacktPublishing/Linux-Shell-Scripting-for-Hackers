#!/bin/bash

./nikto.pl -h 192.168.56.102 -output metasploitable-home_page.html
./nikto.pl -h http://192.168.56.102/dvwa -output metasploitable-dvwa.html
./nikto.pl -h http://192.168.56.102/dvwa/vulnerabilities/sqli/ -output metasploitable-sqli.html
./nikto.pl -h http://192.168.56.102/mutillidae -output metasploitable-mutillidae.html
./nikto.pl -h http://192.168.56.102/dav -output metasploitable-webdav.html
./nikto.pl -h http://192.168.56.102/twiki -output metasploitable-twiki.html
./nikto.pl -h 192.168.56.103 -output Breakout-80.html
./nikto.pl -h 192.168.56.103 -ssl -port 10000 -output Breakout-10000.html
./nikto.pl -h 192.168.56.103 -ssl -port 20000 -output Breakout-20000.html

