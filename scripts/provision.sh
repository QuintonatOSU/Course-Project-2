#!/bin/bash
set -e

cd terraform

echo "Creating AWS infrastructure with Terraform..."
terraform init
terraform fmt
terraform validate
terraform apply -auto-approve
PUBLIC_IP=$(terraform output -raw minecraft_public_ip)

cd ..

echo "$PUBLIC_IP" > server_ip.txt
echo "Provisioning complete."
