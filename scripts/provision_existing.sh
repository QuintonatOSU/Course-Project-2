#!/bin/bash
set -e

INSTANCE_ID="i-0cb8c6544fa08833e"

echo "Starting existing Minecraft EC2 instance: $INSTANCE_ID"
aws ec2 start-instances --instance-ids "$INSTANCE_ID" > /dev/null

echo "Waiting for instance to enter running state..."
aws ec2 wait instance-running --instance-ids "$INSTANCE_ID"

echo "Waiting for instance status checks..."
aws ec2 wait instance-status-ok --instance-ids "$INSTANCE_ID"

PUBLIC_IP=$(aws ec2 describe-instances \
  --instance-ids "$INSTANCE_ID" \
  --query "Reservations[0].Instances[0].PublicIpAddress" \
  --output text)

echo "Minecraft server public IP: $PUBLIC_IP"

echo "$PUBLIC_IP" > server_ip.txt

echo "Creating Ansible inventory..."
cat > ansible/inventory.ini <<EOL
[minecraft]
$PUBLIC_IP ansible_user=ubuntu ansible_ssh_private_key_file=/home/quinton/.ssh/MinecraftKey.pem ansible_ssh_common_args='-o StrictHostKeyChecking=no'
EOL

echo "Provisioning complete."
echo "Next run: ./scripts/configure.sh"
