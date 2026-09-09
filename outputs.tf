output "public_ip" {
    value = aws_instance.this.public_ip
}
output "instance_id" {
  description = "Identifiant de l'instance (utilise par les scripts stop/start)"
  value       = aws_instance.this.id
}

output "security_group_id" {
  description = "Identifiant du security group, pour y raccrocher d'autres regles"
  value       = aws_security_group.this.id
}