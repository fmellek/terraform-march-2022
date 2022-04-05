variable "tag" {
    type = string
    description = "This variable represent the name of the vpc"
    default = "my_custom_vpc"
}

variable "igw-tag" {
    type = string
    description = "This variable represenet the name of the internet gateway"
    default = "Public-Route-Table"
}

variable "cidr_block" {
    type = list
    description = "This variable represent the range of the IP"
    default = [ "10.0.0.0/16", "10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24", "10.0.11.0/24", "10.0.12.0/24", "10.0.13.0/24" ]
}

variable "tenancy" {
    type = string 
    description = "This variable represent the tenancy situation of VPC"
    default = "default"
}

variable "az_name" {
 type = list  
 default = [ "us-east-1a", "us-east-1b", "us-east-1c" ]
}

variable "tagging_subnets_public" {
    type = list
    description = "This variable represent the name of the each subnet under public"
    default = [ "public-subnet-a", "public-subnet-b", "public-subnet-c" ]
  }

  variable "tagging_route_table" {
      type = list
      description = "This variable represent the name of the Route Table."
      default = [ "Public-Route-Table", "Private-Route-Table" ]
        }

variable "destination_cidr_public" {
    type = string
    description = "This variable represent the cidr block under route table."
    default = "0.0.0.0/0"
}

variable "tagging_subnets-private" {
    type = list
    description = "This variable represent the name of the each subnet under private"
    default = [ "private-subnet-a", "private-subnet-b", "private-subnet-c" ]
  }

