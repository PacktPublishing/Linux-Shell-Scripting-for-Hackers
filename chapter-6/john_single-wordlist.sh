#!/bin/bash

InputList="${1}"

if [[ $# -ne 1 ]]; then
	echo "You need to supply the name of an unshadowed hash file."
	echo "List only one file name."
	exit 1
fi

john "${InputList}" --single
john "${InputList}" --wordlist
