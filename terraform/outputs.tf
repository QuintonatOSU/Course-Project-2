output "minecraft_public_ip" {
  description = "Public IP address of the Minecraft server"
  value       = aws_instance.minecraft.public_ip
}

output "ssh_command" {
  description = "SSH command for troubleshooting only"
  value       = "ssh -i ~/.ssh/minecraft_cp2_key ubuntu@${aws_instance.minecraft.public_ip}"
}
