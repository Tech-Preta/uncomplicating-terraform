# Output para exibir IPs públicos das instâncias
output "instance_public_ips" {
  value = [for instance in aws_instance.devops : instance.public_ip]
}
