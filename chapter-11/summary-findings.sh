#!/bin/bash
# Count vulnerabilities by severity
high=$(jq '[.vulnerabilities[] | select(.cvss >= 7.0)] | 
length' scan_results.json)
medium=$(jq '[.vulnerabilities[] | select(.cvss >= 4.0 and 
.cvss < 7.0)] | length' scan_results.json)
low=$(jq '[.vulnerabilities[] | select(.cvss < 4.0)] | 
length' scan_results.json)
# Output summary
echo "Vulnerability Summary:"
echo "High: $high"
echo "Medium: $medium"
echo "Low: $low"