variable "aws_region" {
  description = "AWS region to deploy the Minecraft server in"
  type        = string
  default     = "us-east-1"
}

variable "instance_type" {
  description = "EC2 instance type for the Minecraft server"
  type        = string
  default     = "t2.medium"
}

variable "allowed_ssh_cidr" {
  description = "CIDR block allowed to SSH into the instance"
  type        = string
}

variable "public_key_path" {
  description = "Path to the public SSH key Terraform will register with AWS"
  type        = string
}
