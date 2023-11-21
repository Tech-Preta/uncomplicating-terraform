# Output para a ID da instância EC2
output "instance_id" {
  description = "ID da instância EC2 criada"
  value       = [for i in aws_instance.dev : i.id]
}

# Output para o ip público da instância EC2
output "public_ip" {
  description = "Endereço IP público da instância EC2 criada"
  value       = [for i in aws_instance.dev : i.public_ip]
}

# Output para o nome da instância EC2
output "instance_name" {
  description = "Nome da instância EC2"
  value       = [for i in aws_instance.dev : i.tags.Name]
}

# Output para o bloco EBS da instância EC2
output "ebs_info" {
  description = "Informações do bloco EBS da instância EC2"
  value       = [for i in aws_instance.dev : i.root_block_device]
}

# Output para a ID da VPC da instância EC2
output "vpc_id" {
  description = "ID da VPC da instância EC2"
  value       = [for i in aws_instance.dev : i.subnet_id]
}

output "instance_ip" {
  value = [for i in aws_instance.dev : i.public_ip]
}
