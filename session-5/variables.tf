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

variable "ec2_inbound_rules" {
    type = list(string)
    description = "This variable represent list of ports for inbound rule"
    default = [ "22", "80", "443" ]
}

variable "ec2_inbound_rules_cidr" {
    type = list(string)
    description = "This variable represent list of CIDR ranges for inbound rules"
    default = [ "0.0.0.0/0", "10.0.0.0/16", "10.0.0.0/24" ]
  
}

# Variables are for reusable purpose, something that is repeated over and over again.