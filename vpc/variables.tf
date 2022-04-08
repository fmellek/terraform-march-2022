variable "tags" {
    type = map
    default = {
        "ENV" : "dev",
        "Project" : "VPC"
    }
  
}


variable "vpc_cidr_block" {
    type = string
    description = "This variable represent the range of the IP"
    default = "10.0.0.0/16" 
}

variable "public_cidr_subnet" {
    type = list(string)
    default = [ "10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24" ]
  
}

variable "private_cidr_subnet" {
    type = list(string)
    default = [ "10.0.11.0/24", "10.0.12.0/24", "10.0.13.0/24" ]
  
}

variable "az_name" {
 type = list(string) 
 default = [ "us-east-1a", "us-east-1b", "us-east-1c" ]
}


variable "destination_cidr_public" {
    type = string
    description = "This variable represent the cidr block under route table."
    default = "0.0.0.0/0"
}



  

