# Data source para buscar a AMI mais recente do Ubuntu
data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server*"]
  }

  owners = ["099720109477"] # Este é o ID do proprietário da Canonical, a empresa por trás do Ubuntu
}

# Cria a VPC
resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/16"
}

# Cria a Subnet
resource "aws_subnet" "my_subnet" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = "10.0.1.0/24"
}

# Cria o Internet Gateway
resource "aws_internet_gateway" "my_igw" {
  vpc_id = aws_vpc.my_vpc.id
}

# Cria a rota para a internet
resource "aws_route_table" "my_route_table" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my_igw.id
  }
}

# Cria a interface de rede com endereço IPv4 público
resource "aws_network_interface" "my_network_interface" {
  subnet_id       = aws_subnet.my_subnet.id
  security_groups = [aws_security_group.my_security_group.id]

}

# Cria o Security Group
resource "aws_security_group" "my_security_group" {
  name_prefix = "my_security_group"
  vpc_id      = aws_vpc.my_vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Cria a instância EC2 e associa a interface de rede
resource "aws_instance" "my_ec2_instance" {
  ami           = data.aws_ami.ubuntu.id # ID da AMI a ser usada
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.my_subnet.id
  key_name      = "my-key" # Substitua pelo nome da sua chave
  root_block_device {
    volume_size = 20
    volume_type = "gp2"
  }

  vpc_security_group_ids = [aws_security_group.my_security_group.id]

  associate_public_ip_address = true # Aqui você atribui um IP público


  tags = {
    Name = "My EC2 Instance"
  }

}

