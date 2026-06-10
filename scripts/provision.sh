#!/bin/bash

set -e

cd terraform

echo "Initializing Terraform..."
terraform init

echo "Checking Terraform formatting..."
terraform fmt

echo "Validating Terraform files..."
terraform validate

echo "Creating AWS infrastructure..."
terraform apply -auto-approve

echo "Minecraft server public IP:"
terraform output -raw minecraft_public_ip
