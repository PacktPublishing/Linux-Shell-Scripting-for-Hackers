#!/bin/bash

InputList="${1}"
WordList="${2}"

if [[ $# -lt 1 || $# -gt 2 ]]; then
	echo "You need to supply the name of an unshadowed hash file."
	echo "Optionally, specify the name of a password wordlist,"
	echo "if you don't want to use the default wordlist."
	echo "Only enter two arguments."
	exit 1
fi

if [[ -z "${WordList}" ]]; then
	john "${InputList}" --single --format=crypt
	john "${InputList}" --wordlist --format=crypt
else
	
	john "${InputList}" --single --format=crypt
	john "${InputList}" --wordlist="${WordList}" --format=crypt
fi
