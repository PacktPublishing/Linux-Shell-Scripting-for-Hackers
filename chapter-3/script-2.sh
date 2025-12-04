#!/bin/bash

read -t 10 -p "Enter the target hostname (10 second timeout): " target_host

if [ -z "$target_host" ]; then
    echo "No input received. Timeout reached."
    exit 1
fi

echo "Performing host discovery on $target_host..."
