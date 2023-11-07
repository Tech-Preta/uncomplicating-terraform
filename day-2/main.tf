provider "aws" {
  region = "us-east-2"
}

terraform {
  backend "s3" {
    bucket         = "descomplicando-terraform-granato-tfstates" # Nome do bucket S3 onde o estado será armazenado
    dynamodb_table = "terraform-state-lock"                      # Nome da tabela DynamoDB para travar o estado
    key            = "terraform.tfstate"                         # Nome do arquivo de estado no bucket
    region         = "us-east-2"                                 # Região da AWS onde o bucket está localizado                               
  }
}
