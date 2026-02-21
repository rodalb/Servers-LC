#!/bin/sh

DIRECTORY=${PWD}/Server.x64
FILE_SRC_COMPILED=${PWD}/Server.Sources/GameServer/GameServer_d

if [ -d "$DIRECTORY" ]; then
	echo ""
	echo "Directory: $DIRECTORY does exist."
	echo "Skip archive unpack"
	echo "Before archive unpack -> delete Server.x64 directory"
	echo ""
else 
	echo ""
	echo "Directory: $DIRECTORY does not exist."
	echo "Unpack archive LC2018.Server.x64"
	echo ""
	tar xJpf archives/LC2015.Server.x64.tar.xz
fi

if [ -f "$FILE_SRC_COMPILED" ]; then
	echo ""
	echo "File: $FILE_SRC_COMPILED does exist."
	echo "Copy server binaries."
	echo ""
	cp -vf Server.Sources/Connector/Connector Server.x64/Connector/
	cp -vf Server.Sources/GameServer/GameServer_d Server.x64/GameServer/
	cp -vf Server.Sources/Helper/Helper Server.x64/Helper/
	cp -vf Server.Sources/LoginServer/LoginServer Server.x64/LoginServer/
	cp -vf Server.Sources/Messenger/Messenger Server.x64/Messenger/
	cp -vf Server.Sources/SubHelper/SubHelper Server.x64/SubHelper/
	echo ""
else 
	echo ""
	echo "File: $FILE_SRC_COMPILED does not exist."
	echo "Before copy server binaries -> compile it."
	echo ""
fi

# Finish
