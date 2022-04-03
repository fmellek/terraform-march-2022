variable "env" {
    type = string
    description = "This variable represents an environment"
    default = "dev"
}

variable "ami" {
    type = string
    description = "Image ID for EC2 Instance"
    default = "ami-04a50faf2a2ec1901"
}

variable "instance_type" {
    type = string 
    description = "Capacity"
    default = "t2.micro"
}

# Variables are for reusable purpose, something that is repeated over and over again.