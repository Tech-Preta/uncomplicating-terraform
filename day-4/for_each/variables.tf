variable "hash_commit" {
  description = "O hash do commit a ser implantado"
  type        = string
  default     = "master"
}

variable "instance_types" {
  type = map(string)
  default = {
    instance1 = "t2.micro",
    instance2 = "t3.medium"
  }
}

variable "vpc_id" {
  description = "O ID da VPC"
  type        = string
  default     = "vpc-0e9166caa8d1c7803" # Substitua pelo ID da VPC desejada ou remova o valor padrão
}


variable "subnet_id_instance1" {
  description = "ID da sub-rede para a instance1"
  type        = string
  default     = "subnet-0cd0d31a2dc5fea93"
}

variable "subnet_id_instance2" {
  description = "ID da sub-rede para a instance2"
  type        = string
  default     = "subnet-0cd0d31a2dc5fea93"
}
