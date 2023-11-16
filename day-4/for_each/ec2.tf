# Data source para buscar a AMI mais recente do Ubuntu
data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server*"]
  }

  owners = ["099720109477"] # Este é o ID do proprietário da Canonical, a empresa por trás do Ubuntu
}

# Arquivo principal que define os recursos

resource "aws_instance" "devops" {
  for_each      = var.instance_types
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_types[each.key]
  subnet_id     = each.key == "instance1" ? var.subnet_id_instance1 : var.subnet_id_instance2

  tags = {
    Name = "devops-${each.key}"
  }
}

