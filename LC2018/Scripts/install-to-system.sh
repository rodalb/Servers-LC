#!/bin/sh

DIRECTORY=${PWD}/Server.x64
FILE_SRC_COMPILED=${PWD}/Server.Sources/GameServer/GameServer_d

if [ -d "$DIRECTORY" ]; then
	echo ""
	echo "Directory: $DIRECTORY does exist."
	echo "All OK"
	echo ""
else 
	echo ""
	echo "Directory: $DIRECTORY does not exist."
	echo "Before install to system make local installarion"
	echo ""
	exit
fi

if [ -f "$FILE_SRC_COMPILED" ]; then
	echo ""
	echo "File: $FILE_SRC_COMPILED does exist."
	echo "Copy server binaries."
	echo ""
	sudo mkdir /opt/LCS2018
	sudo mkdir /opt/LCS2018/LogFiles
	sudo chmod 755 /opt/LCS2018/LogFiles
	sudo cp -ax $DIRECTORY/* /opt/LCS2018
	sudo cp -vf ${PWD}/systemd/lcs2018-start.sh /opt/LCS2018
	sudo cp -vf ${PWD}/systemd/lcs2018-stop.sh /opt/LCS2018
	sudo cp -vf ${PWD}/systemd/lcs2018.service /etc/systemd/system
	sudo systemctl enable lcs2018.service
	sudo systemctl start lcs2018.service
	echo ""
	echo "Start lcs2018 service."
	echo ""
else 
	echo ""
	echo "File: $FILE_SRC_COMPILED does not exist."
	echo "Before copy server binaries -> compile it."
	echo ""
fi

# Finish
