# Course Project 2

## Background

This project automates the creation and setup of a Minecraft Java Edition Server on AWS. This project is optimized for the prompt provided from Course Project 1 (A friendly and casual office setting). The goal of this project is to automate the process using tools for configuration and infrastructure. The project uses Terraform, Docker, Ansible, AWS CLI, nmap, and shell scripts to function.

The Terraform files were inspired and adapted from https://registry.terraform.io/providers/hashicorp/aws/latest/docs, where I modified code snippets to be better optimized for a minecraft server. There were several errors during testing, where I was unable to repeatedly create EC2 instances due to constant shutdown. To remedy this, the working project uses the same EC2 instance from Course Project 1 as its target. Keep in mind that the instance is started through the shell scripts (AWS CLI) and then configured through Ansible.

The final demo does not require ANY manual sshing into the instance OR using the AWS console. I only used the Learner Lab to retrieve authentication details.

## Requirements

The following tools should be installed:
- AWS CLI
- Ansible
- Docker (Installed by Ansible onto the EC2 Instance)
- nmap
- Git
- Bash shell
- Terraform

The project is run from Ubuntu/WSL client on Windows.

## AWS

To run the project pipeline, the user needs access to an AWS account. AWS CLI credentials should be provided and configured with:

```bash
mkdir -p ~/.aws
nano ~/.aws/creditentials
```

Please do not share these credentials anywhere.

The AWS config file should be created with:

nano ~/.aws/config

Example config:

[default]
region = us-east-1
output = json

Test AWS access with:

aws sts get-caller-identity

## SSH Key
You must use a Key Pair to access the project. The private SSH key must be named "MinecraftKey.pem" for the project to run properly. The Key Pair can be obtained by creating a new key pair, or by using an existing key and changing the name.

The private SSH key should be stored in the user’s home `.ssh` directory:
```bash
mkdir -p ~/.ssh
cp /path/to/MinecraftKey.pem ~/.ssh/MinecraftKey.pem
chmod 400 ~/.ssh/MinecraftKey.pem
```


## Commands to Run

### Clone or Enter Repository
```bash
cd Course-Project-2
```

### Confirm AWS credentials work
```bash
aws sts get-caller-identity
```

### Start the EC2 instance
```bash
./scripts/provision_existing.sh
```

### Configure Minecraft Server
```bash
./scripts/configure.sh
```

### Verify Minecraft Server Integrity
```bash
./scripts/test_server.sh
```
Expected Output Example:
PORT STATE SERVICE VERSION
25565/tcp open minecraft Minecraft 26.1.2
### Connecting to the Server in Minecraft Client.

Open the Minecraft Launcher, and launch Minecraft with the correct version. (26.1.2)
Navigate to the Multiplayer page.

Ensure that you have an easy way to access the IP Address.
**Note:** The Current Minecraft Server IP Address should be in server_ip.txt
You can view the IP address with:
```bash
cat server_ip.txt
```

Select **Add Server**:
- Server Name: (Enter whatever server name you'd like!)
- Server Address: \[EC2 IP Address]
- **Done**

Connect to the Minecraft Server! 

## Cleanup
To stop the EC2 instance after testing, run:

```bash
aws ec2 stop-instances --instance-ids i-0cb8c6544fa08833e
```
## Sources Used:

Creating EC2/ECS/EKS Instances Using Terraform - https://registry.terraform.io/providers/hashicorp/aws/latest/docs

Helpful Ansible Documentation - https://docs.ansible.com/projects/ansible/latest/collections/ansible/builtin/apt_module.html

Minecraft Docker Code Snippets Implementation (itzg/minecraft implementation) - https://docker-minecraft-server.readthedocs.io/en/latest/

Ansible Playbook CLI Documentation — used for running `ansible-playbook -i ansible/inventory.ini ansible/setup_docker_minecraft.yml`.
https://docs.ansible.com/projects/ansible/latest/cli/ansible-playbook.html

Script Logic and Code Snippets - https://docs.aws.amazon.com/cli/latest/reference/ec2/describe-instances.html

Bash Command Substitution Documentation - https://www.gnu.org/software/bash/manual/html_node/Command-Substitution.html