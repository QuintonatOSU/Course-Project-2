#!/bin/bash
set -e

if [ ! -f server_ip.txt ]; then
  echo "server_ip.txt not found. Run ./scripts/provision.sh first."
  exit 1
fi

PUBLIC_IP=$(cat server_ip.txt)

echo "Waiting for Minecraft server to finish starting..."
sleep 180

echo "Testing Minecraft server at $PUBLIC_IP on port 25565..."
nmap -sV -Pn -p T:25565 "$PUBLIC_IP"
