#!/bin/bash
# Sample data
high=15
medium=10
low=5
# Function to print bars
print_bar() {
 local label=$1
 local count=$2
 echo -n "$label: "
 for ((i=0; i<count; i++)); do
 echo -n "#"
 done
 echo " ($count)"
}
# Print the chart
echo "Vulnerability Severity Chart"
print_bar "High" $high
print_bar "Medium" $medium
print_bar "Low" $low
