# Data source para buscar a AMI mais recente do Ubuntu
data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server*"]
  }

  owners = ["099720109477"] # Este é o ID do proprietário da Canonical, a empresa por trás do Ubuntu
}

# Configura o provedor AWS
provider "aws" {
  region = "us-east-2" # Substitua pela região desejada
}

# Cria uma instância EC2
resource "aws_instance" "dev" {
  ami           = data.aws_ami.ubuntu.id # ID da AMI a ser usada
  instance_type = "t2.micro"             # Tipo de instância desejado
  subnet_id     = var.vpc_id             # Utiliza a variável para a VPC ID
  tags = {
    Name = "dev" # Rótulo para identificar a instância
  }
}

# Exemplo de recurso para criar uma instância EC2

# Você pode especificar a AMI (Amazon Machine Image) que deseja usar substituindo o AMI ID.
# Certifique-se de substituir a região no provedor AWS de acordo com a sua preferência.
# Após definir este arquivo, você pode executar "terraform init" e "terraform apply" para criar a instância.
