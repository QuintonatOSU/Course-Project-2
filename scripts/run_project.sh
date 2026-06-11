#!/bin/bash
set -e

echo "======================================"
echo " Course Project 2 Minecraft Pipeline"
echo "By Quinton Gonzales"
echo "======================================"

echo
echo "Step 1: Provisioning AWS infrastructure with Terraform..."
./scripts/provision.sh

echo
echo "Step 2: Configuring Minecraft server with Ansible and Docker..."
./scripts/configure.sh

echo
echo "Step 3: Testing Minecraft server with nmap..."
./scripts/test_server.sh

PUBLIC_IP=$(cat server_ip.txt)
echo
echo "======================================"
echo "The Minecraft Server has been provisioned, configured, and nmaped successfully!"
echo "You can connect to the server at: $PUBLIC_IP"
echo "You can run './scripts/cleanup.sh' at any point to terminate the server and clean up AWS resources."
echo "======================================"
