variable "tag" {
    type = string
    description = "This variable represent the name of the vpc"
    default = "my_custom_vpc"
}

variable "cidr_block" {
    type = string
    description = "This variable represent the range of the IP"
    default = "10.0.0.0/16"
}

variable "tenancy" {
    type = string 
    description = "This variable represent the tenancy situation of VPC"
    default = "default"
}