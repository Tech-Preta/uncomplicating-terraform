variable "name" {
  description = "O nome da instância EC2"
  type        = string
  default     = "granato"

}


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
  default     = "day-5"
}
variable "subnet_id" {
  description = "O ID da Subnet"
  type        = string
  default     = "subnet-0cd0d31a2dc5fea93" # Substitua pelo ID da Subnet desejada ou remova o valor padrão
}
