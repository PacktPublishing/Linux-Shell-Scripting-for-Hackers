#!/bin/bash

firewall-cmd --set-default-zone=dmz
firewall-cmd --permanent --remove-service=ssh
firewall-cmd --permanent --add-rich-rule='rule family=ipv4 source address="192.168.0.201" service name=ssh accept'
firewall-cmd --permanent --add-rich-rule='rule family=ipv4 source address="192.168.0.201" service name=cockpit accept'

firewall-cmd --permanent --add-service={http,https}
firewall-cmd --reload
