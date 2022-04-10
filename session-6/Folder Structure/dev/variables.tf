variable "ami" {
    type = string
    description = "This is an AMI for my web instance."
    default = "ami-04a50faf2a2ec1901"
}

variable "instance_type" {
    type = string
    description = "This is an instance type for web instance."
    default = "t2.micro"
  
}

variable "env" {
    type = string
    description = "This variable represent the environment"
    default = "dev"
  
}

variable "web_sg_ports" {
    type = list(string)
    description = "These are the ports for my security group."
    default = [ "22", "80" ]

  
}

variable "web_sg_ports_cidr" {
    type = list(string)
    description = "These are the cidr_blocks for my ports."
  default = [ "0.0.0.0/0", "0.0.0.0/0" ]
}