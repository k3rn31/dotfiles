#!/bin/bash
#
# checknet.sh
#
# Small script to check if Internet is reachable. It uses google.com as
# the host to ping, assuming it is always reachable.

HOST="google.com"

if ping -c 1 $HOST &> /dev/null
then
	echo "Internet is up!"
else
	echo "Internet is down..."
fi
