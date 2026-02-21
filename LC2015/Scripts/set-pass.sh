#!/bin/sh

ARG="$@"

# Usage
if [ "$ARG" = "" ]; then
	echo ""
	echo "USAGE:"
	echo ""
	echo "./set-pass.sh <PASSWORD>"
	echo ""
	echo "EXAMPLE:"
	echo ""
	echo "/set-pass.sh 1234NotRecomendedPassword"
	echo ""
	echo ""
	exit
fi

REPLACE_STR="s/Password=Password/Password="${ARG}"/g"

find . -name "newStobm.bin" -exec sed -i ${REPLACE_STR} {} +

echo "Password changed."
echo ""
echo "If you specified an incorrect password,"
echo "then run script ./install-server.sh again."
echo ""
echo ""
