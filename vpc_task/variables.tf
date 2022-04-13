
variable "env" {
    type = string
    description = "This variable represent the common tag for our task."
    default = "environment"
  
}
variable "project" {
    type = string
    description = "This variable represent the common tag for our task."
    default = "VPC"
  
}

variable "vpc_cidr_block" {
    type = string
    description = "This variable represent the cidr block of vpc"
    default = "10.0.0.0/16"
}

variable "instance_tenancy" {
    type = string
    default = "default"
}

variable "rt_cidr_block" {
    type = string
    default = "0.0.0.0/0"
  
}

variable "subnet_name" {
    type = list(string)
    default = [ "us-east-1a", "us-east-1b", "us-east-1c" ]
  
}
variable "public_cidr_subnet" {
    type = list(string)
    default = [ "10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24" ]
  
}
variable "private_cidr_subnet" {
    type = list(string)
    default = [ "10.0.11.0/24", "10.0.12.0/24", "10.0.13.0/24" ]
  
}
