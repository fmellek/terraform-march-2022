variable "vpc_cidr_block" {
    type = string
    description = "This variable represent the cidr block of vpc"
    default = "10.0.0.0/16"
}

variable "instance_tenancy" {
    type = string
    default = "default"
}