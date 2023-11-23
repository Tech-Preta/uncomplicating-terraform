terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0" # Use o operador "~>" para buscar a versão mais recente a partir da 3.0
    }
  }
}
