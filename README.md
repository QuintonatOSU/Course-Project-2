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

##

## Sources Used:

Creating EC2/ECS/EKS Instances Using Terraform - https://registry.terraform.io/providers/hashicorp/aws/latest/docs

Helpful Ansible Documentation - https://docs.ansible.com/projects/ansible/latest/collections/ansible/builtin/apt_module.html

Minecraft Docker Code Snippets Implementation (itzg/minecraft implementation) - https://docker-minecraft-server.readthedocs.io/en/latest/

Ansible Playbook CLI Documentation — used for running `ansible-playbook -i ansible/inventory.ini ansible/setup_docker_minecraft.yml`.
https://docs.ansible.com/projects/ansible/latest/cli/ansible-playbook.html

Script Logic and Code Snippets - https://docs.aws.amazon.com/cli/latest/reference/ec2/describe-instances.html

Bash Command Substitution Documentation - https://www.gnu.org/software/bash/manual/html_node/Command-Substitution.html