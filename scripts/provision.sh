#!/bin/bash
set -e

cd terraform

echo "Initializing Terraform..."
terraform init

echo "Formatting Terraform files..."
terraform fmt

echo "Validating Terraform files..."
terraform validate

echo "Creating AWS infrastructure..."
terraform apply -auto-approve

PUBLIC_IP=$(terraform output -raw minecraft_public_ip)

cd ..

echo "$PUBLIC_IP" > server_ip.txt

echo "Minecraft server public IP: $PUBLIC_IP"
echo "Provisioning complete."
