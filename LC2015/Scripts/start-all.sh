#!/bin/bash

cd /home/LCServer/LCS2015/Server.x64

# Prepare ENV
export LD_LIBRARY_PATH=${PWD}/CashServer:$LD_LIBRARY_PATH

echo "Iniciando servidores Last Chaos..."

# Messenger
cd Messenger
./Messenger > /tmp/messenger.log 2>&1 &
echo "✓ Messenger iniciado (PID: $!)"
cd ..
sleep 2

# Helper
cd Helper
./Helper > /tmp/helper.log 2>&1 &
echo "✓ Helper iniciado (PID: $!)"
cd ..
sleep 2

# SubHelper
cd SubHelper
./SubHelper > /tmp/subhelper.log 2>&1 &
echo "✓ SubHelper iniciado (PID: $!)"
cd ..
sleep 2

# CashServer
cd CashServer
./CashServer > /tmp/cashserver.log 2>&1 &
echo "✓ CashServer iniciado (PID: $!)"
cd ..
sleep 2

# Connector
cd Connector
./Connector > /tmp/connector.log 2>&1 &
echo "✓ Connector iniciado (PID: $!)"
cd ..
sleep 2

# LoginServer
cd LoginServer
./LoginServer > /tmp/loginserver.log 2>&1 &
echo "✓ LoginServer iniciado (PID: $!)"
cd ..
sleep 2

# GameServer
cd GameServer
./GameServer_d > /tmp/gameserver.log 2>&1 &
echo "✓ GameServer iniciado (PID: $!)"
cd ..

echo ""
echo "Todos os servidores foram iniciados!"
