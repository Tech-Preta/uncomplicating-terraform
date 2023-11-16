provider "aws" {
  region = "us-east-2" # Altere para a região desejada
}
# Data source para buscar a AMI mais recente do Ubuntu
data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server*"]
  }

  owners = ["099720109477"] # Este é o ID do proprietário da Canonical, a empresa por trás do Ubuntu

}

resource "aws_instance" "minha-ec2" {
  ami           = data.aws_ami.ubuntu.id # AMI mais recente do Ubuntu
  instance_type = var.instance_types
  key_name      = "my-key" # Altere para o nome da sua chave SSH

  vpc_security_group_ids = var.vpc_security_group_ids # Altere para o ID do seu Security Group

  subnet_id = var.subnet_id

  tags = merge({ "Name" = var.instance_name }, var.additional_tags)
}

