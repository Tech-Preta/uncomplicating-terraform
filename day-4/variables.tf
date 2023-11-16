variable "instance_count" {
  description = "O número de instâncias EC2 a serem criadas"
  type        = number
  default     = 1
}

variable "instance_type" {
  description = "O tipo de instância EC2"

  default = "t2.micro"
}
variable "workspace" {
  description = "O nome do Workspace"
  type        = string
  default     = "day-4"
}
variable "vpc_id" {
  description = "O ID da VPC"
  type        = string
  default     = "vpc-0123456789abcdef0" # Substitua pelo ID da VPC desejada ou remova o valor padrão
}

