#!/bin/bash
set -e

if [ ! -f server_ip.txt ]; then
  echo "server_ip.txt not found. Run ./scripts/provision.sh first."
  exit 1
fi

PUBLIC_IP=$(cat server_ip.txt)

echo "Minecraft server public IP is: $PUBLIC_IP"

echo "Creating Ansible inventory..."
cat > ansible/inventory.ini <<EOL
[minecraft]
$PUBLIC_IP ansible_user=ubuntu ansible_ssh_private_key_file=$HOME/.ssh/minecraft_cp2_key ansible_ssh_common_args='-o StrictHostKeyChecking=no'
EOL

echo "Waiting 90 seconds for EC2 to finish booting..."
sleep 90

echo "Running Ansible playbook..."
ansible-playbook -i ansible/inventory.ini ansible/setup_docker_minecraft.yml
