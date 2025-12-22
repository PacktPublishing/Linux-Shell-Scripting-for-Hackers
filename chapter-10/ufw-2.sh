#!/bin/bash

xargs -i ufw prepend deny from {} to any port 80,443 proto tcp < bad_ipaddresses.txt

ufw reload


