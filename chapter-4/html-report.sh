#!/bin/bash 

 

# Set the target IP range 

target_range="192.168.1.0/24" 

 

# Perform a TCP connect scan and version detection scan 

nmap_output=$(nmap -sT -sV -oN - "$target_range") 

 

# Generate the HTML report 

cat << EOF > report.html 

<html> 

<head> 

    <title>Nmap Scan Report</title> 

    <style> 

        table, th, td { border: 1px solid black; border-collapse: collapse; padding: 5px; } 

    </style> 

</head> 

<body> 

    <h1>Nmap Scan Report</h1> 

    <table> 

        <tr> 

            <th>IP Address</th> 

            <th>Port</th> 

            <th>State</th> 

            <th>Service</th> 

            <th>Version</th> 

        </tr> 

        $(echo "$nmap_output" | awk -F'[ /]' '/open/ { printf "<tr><td>%s</td><td>%s</td><td>open</td><td>%s</td><td>%s</td></tr>\\\\n", $5, $1, $3, $4 }') 

    </table> 

</body> 

</html> 

EOF 