variable "aws_region" {
  description = "A região onde a instância EC2 será criada."
  type        = string
  default     = "us-east-2" # Pode ser substituído pela região desejada
}

variable "instance_type" {
  description = "O tipo de instância EC2 a ser criado."
  type        = string
  default     = "t2.micro" # Pode ser substituído pelo tipo desejado
}

variable "instance_name" {
  description = "O nome da instância EC2."
  type        = string
  default     = "dev" # Pode ser substituído pelo nome desejado
}

variable "ebs_volume_size" {
  description = "Tamanho do disco EBS em gigabytes (GB)."
  type        = number
  default     = 8
  validation {
    condition     = var.ebs_volume_size >= 8 && var.ebs_volume_size <= 2000
    error_message = "O tamanho do disco EBS deve estar entre 8 GB e 2000 GB."
  }
}


variable "vpc_id" {
  description = "ID da VPC onde a instância EC2 será criada."
  type        = string
  default     = "vpc-0123456789abcdef0" # Substitua pelo ID da VPC desejada ou remova o valor padrão
}

