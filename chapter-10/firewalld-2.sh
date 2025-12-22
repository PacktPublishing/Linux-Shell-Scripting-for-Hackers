#!/bin/bash

xargs -i firewall-cmd --permanent --add-rich-rule="rule family="ipv4" source address={} service name=http drop" < bad_ipaddresses.txt
xargs -i firewall-cmd --permanent --add-rich-rule="rule family="ipv4" source address={} service name=https drop" < bad_ipaddresses.txt
firewall-cmd --reload


