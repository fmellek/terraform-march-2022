resource "aws_vpc" "my_custom_vpc" {
    tags = {
        Name = var.tag
    }
    cidr_block = var.cidr_block[0]
    instance_tenancy = var.tenancy
}

resource "aws_internet_gateway" "internet-gw" {
    vpc_id = aws_vpc.my_custom_vpc.id
    tags = {
        Name = var.igw-tag 
    }
}

resource "aws_subnet" "public_1" {
    vpc_id = aws_vpc.my_custom_vpc.id
    availability_zone = var.az_name[0]
    cidr_block = var.cidr_block[1]
    tags = {
      Name = var.tagging_subnets[0]
    }
}

resource "aws_subnet" "public_2" {
    vpc_id = aws_vpc.my_custom_vpc.id
    availability_zone = var.az_name[1]
    cidr_block = var.cidr_block[2]
    tags = {
      Name = var.tagging_subnets[1]
    }
}

resource "aws_subnet" "public_3" {
    vpc_id = aws_vpc.my_custom_vpc.id
    availability_zone = var.az_name[2]
    cidr_block = var.cidr_block[3]
    tags = {
      Name = var.tagging_subnets[2]
    }
}