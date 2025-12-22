#!/bin/bash

ufw allow log from 192.168.0.201 to any port 22 proto tcp
ufw allow "Apache Full"
ufw --force enable
ufw reload
ufw status verbose
