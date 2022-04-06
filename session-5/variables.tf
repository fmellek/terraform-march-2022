variable "env" {
    type = string
    description = "This variable represents an environment"
    default = "dev"
}



variable "instance_type" {
    type = string 
    description = "Capacity"
    default = "t2.micro"
}

# Variables are for reusable purpose, something that is repeated over and over again.