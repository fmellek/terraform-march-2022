terraform {
  required_version = "~> 1.1.0" # Terraform Version
  required_providers {           # Provider Version
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.7.0" # ~> 4.7.0 < x < 4.8.0
    }
  }
}