variable "subnet_id" {
  description = "ID da Subnet"
  type        = string
  default     = "value"
}

variable "instance_name" {
  description = "Nome da instância EC2"
  type        = string
  default     = "minha-ec2"
}

variable "vpc_security_group_ids" {
  description = "ID do Security Group"
  type        = list(string)
  default     = ["sg-0f6b721b535d7d269"]

}

variable "instance_types" {
  description = "Tipos de instância EC2"
  type        = string
  default     = "t2.micro"

}

variable "additional_tags" {
  description = "Tags adicionais a serem adicionadas aos recursos"
  type        = map(string)
  default     = {}
}
