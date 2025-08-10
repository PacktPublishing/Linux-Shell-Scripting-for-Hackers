#!/bin/bash

targetfile="${1}"

if [[ ! -s "${targetfile}" ]]; then
	echo "No file specified. Please specify a file."
	exit 1
fi

if [[ -f robots.txt ]]; then
	rm robots.txt
fi

if [[ -f tmpfile.txt ]]; then
	rm tmpfile.txt
fi

scantargets=( $(cat "${targetfile}") )

output_dir="robots_files"
for target in ${scantargets[*]}
do
	echo "Testing "${target}" for robots files"
	curl -s "${target}"/robots.txt -o robots.txt
	if [[ -f robots.txt &&  $(grep 'Disallow: ' robots.txt) ]]; then
		echo -e  "\t Found robots file at ${target}"

		mkdir -p "${output_dir}"/"${target}"
		awk -F'Disallow: ' '{print $2}' robots.txt > tmpfile.txt
		lines=( $(cat tmpfile.txt) )
		for entry in ${lines[*]}
		do
			status="$(curl -s -o /dev/null -w "%{http_code}" "${target}"/"${entry}")"
			echo "Status code for "${target}""${entry}" is : "$status"" >> "${output_dir}"/"${target}"/robots_results.txt
			echo "Status code for "${target}""${entry}" is : "$status""
		done
		rm robots.txt
		rm tmpfile.txt
	else
		echo "No robots.txt file found on the ${target} site."
	fi
done


