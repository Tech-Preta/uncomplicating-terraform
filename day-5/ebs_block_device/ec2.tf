# Data source para buscar a AMI mais recente do Ubuntu
data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server*"]
  }

  owners = ["099720109477"] # Este é o ID do proprietário da Canonical, a empresa por trás do Ubuntu
}

# Cria uma instância EC2
resource "aws_instance" "dev" {
  count         = var.workspace == "day-4" ? 2 : 1 # Cria 2 instâncias se o ambiente for "day-4", caso contrário, cria 1
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  subnet_id     = var.vpc_id # Utiliza a variável para a VPC ID

  ebs_block_device {
    device_name           = "/dev/sdg"
    volume_size           = 5
    volume_type           = "gp2"
    delete_on_termination = false
  }

  tags = {
    Name = "dev-instance-${var.workspace}"
  }
}
