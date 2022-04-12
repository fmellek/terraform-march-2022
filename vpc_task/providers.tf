provider "aws" {
    region = "us-west-1"
}

provider "aws" {
    alias = "us"
    region = "us-east-1"
  }