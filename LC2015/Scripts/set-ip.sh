#!/bin/sh

ARG="$@"

# Usage
if [ "$ARG" = "" ]; then
	echo ""
	echo "USAGE:"
	echo ""
	echo "./set-ip.sh <IP>"
	echo ""
	echo "EXAMPLE:"
	echo ""
	echo "/set-ip.sh 192.168.0.100"
	echo ""
	echo ""
	exit
fi

REPLACE_STR="s/IP=192.168.0.108/IP="${ARG}"/g"

find . -name "newStobm.bin" -exec sed -i ${REPLACE_STR} {} +

echo "IP Address changed."
echo ""
echo "If you specified an incorrect IP address,"
echo "then run script ./install-server.sh again."
echo ""
echo ""

