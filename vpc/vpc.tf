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
      Name = var.tagging_subnets_public[0]
    }
}

resource "aws_subnet" "public_2" {
    vpc_id = aws_vpc.my_custom_vpc.id
    availability_zone = var.az_name[1]
    cidr_block = var.cidr_block[2]
    tags = {
      Name = var.tagging_subnets_public[1]
    }
}

resource "aws_subnet" "public_3" {
    vpc_id = aws_vpc.my_custom_vpc.id
    availability_zone = var.az_name[2]
    cidr_block = var.cidr_block[3]
    tags = {
      Name = var.tagging_subnets_public[2]
    }
}

resource "aws_route_table" "public_route_table" {
    vpc_id = aws_vpc.my_custom_vpc.id
    tags = {
      Name = var.tagging_route_table[0]
    }
}

resource "aws_route_table_association" "first" {
    subnet_id = aws_subnet.public_1.id
    route_table_id = aws_route_table.public_route_table.id
}

resource "aws_route_table_association" "second" {
    subnet_id = aws_subnet.public_2.id
    route_table_id = aws_route_table.public_route_table.id
}

resource "aws_route_table_association" "third" {
    subnet_id = aws_subnet.public_3.id
    route_table_id = aws_route_table.public_route_table.id
}

resource "aws_route" "ingress_route" {
    route_table_id = aws_route_table.public_route_table.id
    destination_cidr_block = var.destination_cidr_public
    gateway_id = aws_internet_gateway.internet-gw.id

  }

  resource "aws_route_table" "private_route_table" {
    vpc_id = aws_vpc.my_custom_vpc.id
    tags = {
      Name = var.tagging_route_table[1]
    }
}

resource "aws_subnet" "private_1" {
    vpc_id = aws_vpc.my_custom_vpc.id
    availability_zone = var.az_name[0]
    cidr_block = var.cidr_block[4]
    tags = {
      Name = var.tagging_subnets_private[0]
    }
}

resource "aws_subnet" "private_2" {
    vpc_id = aws_vpc.my_custom_vpc.id
    availability_zone = var.az_name[1]
    cidr_block = var.cidr_block[5]
    tags = {
      Name = var.tagging_subnets_private[1]
    }
}

resource "aws_subnet" "private_3" {
    vpc_id = aws_vpc.my_custom_vpc.id
    availability_zone = var.az_name[2]
    cidr_block = var.cidr_block[6]
    tags = {
      Name = var.tagging_subnets_private[2]
    }
}