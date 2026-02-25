#!/bin/bash
# Parse JSON output to extract high/critical 
vulnerabilities
jq '.vulnerabilities[] | select(.cvss >= 7.0) | {id: .id, 
description: .description, cvss: .cvss}' scan_results.json 
> high_critical_vulns.json
echo "High/critical vulnerabilities extracted to 
high_critical_vulns.json"