#!/bin/sh

# Prepare ENV
LIB_DIR_CACHE_SERVER=${PWD}/Server.x64/CashServer
export LD_LIBRARY_PATH=${LIB_DIR_CACHE_SERVER}:$LD_LIBRARY_PATH 

ARG="$@"

# Usage
if [ "$ARG" = "" ]; then
	echo ""
	echo "USAGE:"
	echo ""
	echo "./run-server.sh null"
	echo "For run server without windows."
	echo ""
	echo "./run-server.sh xterm"
	echo "For run server with xterm windows."
	echo ""
	echo "./run-server.sh mate"
	echo "For run server without windows."
	echo ""
fi

# Run server without windows
if [ "$ARG" = "null" ]; then
	cd Server.x64/Messenger
	./Messenger >/dev/null 2>&1 &
	cd ..
	sleep 1

	cd Helper
	./Helper >/dev/null 2>&1 &
	cd ..
	sleep 1

	cd SubHelper
	./SubHelper >/dev/null 2>&1 &
	cd ..
	sleep 1

	cd CashServer
	./CashServer >/dev/null 2>&1 &
	cd ..
	sleep 1

	cd Connector
	./Connector >/dev/null 2>&1 &
	cd ..
	sleep 1

	cd LoginServer
	./LoginServer >/dev/null 2>&1 &
	cd ..
	sleep 1

	cd GameServer
	./GameServer_d >/dev/null 2>&1 &
	cd ..
	cd ..

	echo ""
	echo "All Servers started"
	echo ""
fi

# Run server with xterm windows
if [ "$ARG" = "xterm" ]; then
	cd Server.x64/Messenger
	xterm -fn 6x10 -geometry 90x24-0+0 -e ./Messenger &
	cd ..
	sleep 1

	cd Helper
	xterm -fn 6x10 -geometry 90x24-550+0 -e ./Helper &
	cd ..
	sleep 1

	cd SubHelper
	xterm -fn 6x10 -geometry 90x24-1100+0 -e ./SubHelper &
	cd ..
	sleep 1

	cd CashServer
	xterm -fn 6x10 -geometry 90x24-0+560 -e ./CashServer &
	cd ..
	sleep 1

	cd Connector
	xterm -fn 6x10 -geometry 90x24-0+280 -e ./Connector &
	cd ..
	sleep 1

	cd LoginServer
	xterm -fn 6x10 -geometry 90x24-550+280 -e ./LoginServer &
	cd ..
	sleep 1

	cd GameServer
	xterm -fn 6x10 -geometry 90x24-1100+280 -e ./GameServer_d &
	cd ..
	cd ..
fi

# Run server with mate windows
if [ "$ARG" = "mate" ]; then
	cd Server.x64/Messenger
	mate-terminal --geometry 50x10-0+0 -e ./Messenger &
	cd ..
	sleep 1

	cd Helper
	mate-terminal --geometry 50x10-520+0 -e ./Helper &
	cd ..
	sleep 1

	cd SubHelper
	mate-terminal --geometry 50x10-1040+0 -e ./SubHelper &
	cd ..
	sleep 1

	cd CashServer
	mate-terminal --geometry 50x10-0+670 -e ./CashServer &
	cd ..
	sleep 1

	cd Connector
	mate-terminal --geometry 50x10-0+335 -e ./Connector &
	cd ..
	sleep 1

	cd LoginServer
	mate-terminal --geometry 50x10-520+335 -e ./LoginServer &
	cd ..
	sleep 1

	cd GameServer
	mate-terminal --geometry 50x10-1040+335 -e ./GameServer_d &
	cd ..
	cd ..
fi

# Finish
