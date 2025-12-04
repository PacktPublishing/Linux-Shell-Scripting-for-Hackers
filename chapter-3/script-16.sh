#!/bin/bash

# Define the valid options
OPTSTRING="t:p:"

# Use getopt to process the arguments
PARSED=$(getopt -o "$OPTSTRING" -- "$@")
if [ $? != 0 ]; then
    echo "Usage: $0 -t <target> -p <port>"
    exit 1
fi

# Extract the options and their values
eval set -- "$PARSED"
while true; do
    case "$1" in
        -t)
            target=$2
            shift 2
            ;;
        -p)
            port=$2
            shift 2
            ;;
        --)
            shift
            break
            ;;
    esac
done

# Use the extracted options
echo "Scanning target: $target"
echo "Scanning port: $port"

# Perform the actual scan
# TODO