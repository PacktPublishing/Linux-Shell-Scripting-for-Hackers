#!/bin/sh

inputpath="$1"
output_file="$2"
BLACK=$(tput setaf 0)
RED=$(tput setaf 1)

os="$(uname)"

if [ "$#" -ne 2 ]; then
	echo "You need to input the patch to the Apache access logs, followed by the"
	echo "name of the results file that you want to create."
	echo "Example:"
	echo "./xss_detect.sh /var/log/apache2 xss_results.txt"
	exit 1
fi

if [ -f "$output_file" ]; then
	echo "This file already exists. Choose another filename."
	exit;
fi

echo "${RED}Apparent Cross-site scripting attack${BLACK}" >> "$output_file"
find "$inputpath" -iname '*.gz' -exec zcat {} \; | grep 'GET /%' >> "$output_file"
find "$inputpath" -iname '*.gz' -exec zcat {} \; | grep 'GET /.%' >> "$output_file"
find "$inputpath" -iname '*.gz' -exec zcat {} \; | grep 'GET /.=%' >> "$output_file"
if [ "$os" = FreeBSD ]; then
	grep 'GET /%' $inputpath/httpd-access.log >> "$output_file"
	grep 'GET /.%' $inputpath/httpd-access.log >> "$output_file"
	grep 'GET /.=%' $inputpath/httpd-access.log >> "$output_file"
else
	grep 'GET /%' $inputpath/access.log >> "$output_file"
	grep 'GET /.%' $inputpath/access.log >> "$output_file"
	grep 'GET /.=%' $inputpath/access.log >> "$output_file"
fi

echo "***************************************" >> "$output_file"
echo "${RED}Nmap Scripting Scans${BLACK}" >> "$output_file"
find "$inputpath" -iname '*.gz' -exec zcat {} \; | grep -i 'nmap' >> "$output_file"
if [ "$os" = FreeBSD ]; then
	grep -i 'nmap' $inputpath/httpd-access.log >> "$output_file"
else
	grep -i 'nmap' $inputpath/access.log >> "$output_file"
fi
echo "***************************************" >> "$output_file"
echo "${RED}Nikto Scanner Attacks${BLACK}" >> "$output_file"
find "$inputpath" -iname '*.gz' -exec zcat {} \; | grep -i 'nikto' >> "$output_file"
if [ "$os" = FreeBSD ]; then
	grep -i 'nikto' $inputpath/httpd-access.log >> "$output_file"
else
	grep -i 'nikto' $inputpath/access.log >> "$output_file"
fi
exit
