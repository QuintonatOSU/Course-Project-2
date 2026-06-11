# Course Project 2

## Background

This project automates the creation and setup of a Minecraft Java Edition Server on AWS. This project builds on the prompt provided from Course Project 1 (A friendly and casual office setting). The goal of this project is to automate the process using tools for configuration and infrastructure. The project uses Terraform, Docker, Ansible, AWS CLI, nmap, and shell scripts to function.

The Terraform files were inspired and adapted from https://registry.terraform.io/providers/hashicorp/aws/latest/docs, where I modified code snippets to be better optimized for a minecraft server. 

The final demo does not require ANY manual sshing into the instance OR using the AWS console. I only used the Learner Lab to retrieve authentication details.

## Requirements

The following tools should be used/installed:
- Ubuntu/WSL or Linux Terminal Client
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
nano ~/.aws/credentials
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
You must use a Key Pair to access the project.

Create the SSH key with:

``` bash
mkdir -p ~/.ssh
ssh-keygen -t rsa -b 4096 -f ~/.ssh/minecraft_cp2_key -N ""
chmod 400 ~/.ssh/minecraft_cp2_key
```

This creates two files:
~/.ssh/minecraft_cp2_key
~/.ssh/minecraft_cp2_key.pub

Terraform uses the public key file to register the key pair with AWS. Ansible uses the private key file to connect to the EC2 instance.

## File Overview

### scripts/run_project.sh
Runs scripts/provision.sh, scripts/configure.sh, scripts/test_server.sh in that order respectively. Outputs some flavor text for organization and flair.

### scripts/provision.sh
Runs the terraform files to create an EC2 instance given specific parameters. Outputs the instance public IPv4 address to server_ip.txt for later use.

### scripts/configure.sh
Takes the IP Address created from scripts/provision.sh. Creates the Ansible inventory file, to run the ansible playbook to create and configure the minecraft server.

### scripts/test_server.sh
Outputs whether or not the minecraft server is reachable at port 25565 (default minecraft port)

### .gitignore
Prevents specific files from being committed to GitHub.

### terraform/main.tf
Creates the infrastructure for terraforming, AWS, and EC2 instance creation.

### terraform/variables.tf
Defines the configurable instance variables

### terraform/outputs.tf
Prints the needed terraform information.

### ansible/setup_docker_minecraft.yml
Ansible playbook that installs docker to create a consistent minecraft data directory.



## Commands to Run

### Clone or Enter Repository
```bash
cd Course-Project-2
```

### Confirm AWS credentials work
```bash
aws sts get-caller-identity
```
### Run the Program
```bash
./scripts/run_project.sh
```
This should run the complete program. Should this script incur an error, follow the alternate instructions provided below.

## Alternate Instructions (Optional)
### Start the EC2 instance
```bash
./scripts/provision.sh
```

### Configure Minecraft Server
```bash
./scripts/configure.sh
```

### Verify Minecraft Server Integrity
**Note:** It may take time for the minecraft server to start running. I suggest waiting at least 90-180 seconds before running this command.
```bash
./scripts/test_server.sh
```

Expected Output Example:
PORT STATE SERVICE VERSION
25565/tcp open minecraft Minecraft 26.1.2


## Connecting to the Server in Minecraft Client.

Open the Minecraft Launcher, and launch a compatible Minecraft Java Edition client version.
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
./scripts/cleanup.sh
```
**Note:** You may be asked a yes/no answer to destroy the terraform. Enter: "yes"


## Extra Credit Implementation
Docker Image: Docker is used and can be seen in implementation output.
Configure GitHub Actions: 
## Sources Used:

Creating EC2/ECS/EKS Instances Using Terraform - https://registry.terraform.io/providers/hashicorp/aws/latest/docs

Helpful Ansible Documentation - https://docs.ansible.com/projects/ansible/latest/collections/ansible/builtin/apt_module.html

Minecraft Docker Code Snippets Implementation (itzg/minecraft implementation) - https://docker-minecraft-server.readthedocs.io/en/latest/

Ansible Playbook CLI Documentation — used for running `ansible-playbook -i ansible/inventory.ini ansible/setup_docker_minecraft.yml`.
https://docs.ansible.com/projects/ansible/latest/cli/ansible-playbook.html

Script Logic and Code Snippets - https://docs.aws.amazon.com/cli/latest/reference/ec2/describe-instances.html

Bash Command Substitution Documentation - https://www.gnu.org/software/bash/manual/html_node/Command-Substitution.html

Visual Studio Code ML Coding Assistant was used for naming consistency and touch ups on some code snippets.

Some tutorial snippets were obtained by my original project (Course Project 1 by Quinton Gonzales)