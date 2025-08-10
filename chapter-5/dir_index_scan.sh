#!/bin/bash

targetfile="${1}"
reportdir="${2}"

if [[ ! -s "${targetfile}" ]]; then
	echo "No file specified. Please specify a file."
	echo "Usage:  ./dir_index_scan.sh name_of_target_list_file"
	exit 1
fi

if [[ -z "${reportdir}" ]]; then
	reportdir="Indexable_scan_reports"
fi



scantargets=( $(cat "${targetfile}") )

for target in ${scantargets[*]}
do
	echo "Testing "${target}" for indexing"
	if curl -L -s "${target}" | grep -q -e "Index of /" -e  "[PARENTDIR]"; then
		echo -e  "\t Found directory index at ${target}"
		mkdir -p "${reportdir}"
		wget -q -r -np -R "index.html*" "${target}" -P "${reportdir}"
	fi
done
