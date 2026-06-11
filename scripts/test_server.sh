#!/bin/bash
set -e

if [ ! -f server_ip.txt ]; then
  echo "server_ip.txt not found. Run ./scripts/provision.sh first."
  exit 1
fi

PUBLIC_IP=$(cat server_ip.txt)

echo "Waiting for Minecraft server at $PUBLIC_IP to open port 25565..."

for i in {1..20}; do
  if nc -z "$PUBLIC_IP" 25565; then
    echo "Port 25565 is open."
    echo "Running nmap verification..."
    nmap -sV -Pn -p T:25565 "$PUBLIC_IP"
    exit 0
  fi

  echo "Attempt $i/20: port not open yet. Waiting 15 seconds..."
  sleep 15
done

echo "Port 25565 did not open after 5 minutes."
echo "Running nmap anyway for final status..."
nmap -sV -Pn -p T:25565 "$PUBLIC_IP"
exit 1
