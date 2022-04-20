terraform {
  required_version = "~> 1.1.0" # Terraform version
  required_providers {          # Provider version
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.7.0"
    }
  }
}