resource "aws_vpc" "my_vpc_east" {
    cidr_block = var.vpc_cidr_block
    instance_tenancy = var.instance_tenancy
    tags = merge(
        local.common_tags,
         {
            Name = "my_vpc"
       
        
    }
 )
 }

resource "aws_subnet" "public_subnet" {
    count = length(var.subnet_name)
    vpc_id = aws_vpc.my_vpc_east.id
    cidr_block = element(var.public_cidr_subnet, count.index)
    availability_zone = element(var.subnet_name, count.index)
    tags = merge(
        local.common_tags,
        {
            Name = "public_subnet_${count.index}"
        }
    )
  
}

resource "aws_subnet" "private_subnet" {
    count = length(var.subnet_name)
    vpc_id = aws_vpc.my_vpc_east.id
    cidr_block = element(var.private_cidr_subnet, count.index)
    availability_zone = element(var.subnet_name, count.index)
    tags = merge(
        local.common_tags,
        {
            Name = "private_subnet_${count.index}"
        }
    )
  
}

resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.my_vpc_east.id
    tags = merge(
        local.common_tags,
        {
            Name = "internet_gateway"
        }
    )
  
}

resource "aws_eip" "nat_gw_eip" {
    vpc = true 
    tags = merge(
        local.common_tags,
        {
            Name = "elastic_ip"
        }
    )
  
}
resource "aws_nat_gateway" "nat_gw" {
    depends_on = [aws_internet_gateway.igw]
    allocation_id = aws_eip.nat_gw_eip.id
    subnet_id = aws_subnet.public_subnet[0].id
tags = merge(
    local.common_tags,
    {
        Name = "nat_gateway"
    }
)  
}

resource "aws_route_table" "public_rtb" {
    vpc_id = aws_vpc.my_vpc_east.id
    route {
        cidr_block = var.rt_cidr_block
        gateway_id = aws_internet_gateway.igw.id
    }
    tags = merge(
        local.common_tags,
        {
            Name = "public_route_table"
        }
    )
  
}

