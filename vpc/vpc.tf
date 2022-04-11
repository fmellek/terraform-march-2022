resource "aws_vpc" "my_custom_vpc" {
    tags = merge(
      var.tags,
       {
        Name = "my_custom_vpc"

    }
    )
    cidr_block = var.vpc_cidr_block
    instance_tenancy = "default"
    enable_dns_support = true
    enable_dns_hostnames = true 
}

resource "aws_internet_gateway" "internet-gw" {
    vpc_id = aws_vpc.my_custom_vpc.id
    tags = merge( 
      var.tags, 
      {
        Name = "internet_gw"
       
    }
    )
}

resource "aws_subnet" "public_subnet" {
  count = length(var.az_name)
    vpc_id = aws_vpc.my_custom_vpc.id
    availability_zone = element(var.az_name, count.index)
    cidr_block = element(var.public_cidr_subnet, count.index)
    tags = merge(
      var.tags,
      {
      Name = "public_subnet_${count.index}"
    }
    )
}

resource "aws_subnet" "private_subnet" {
  count = length(var.az_name)
    vpc_id = aws_vpc.my_custom_vpc.id
    availability_zone = element(var.az_name, count.index)
    cidr_block = element(var.private_cidr_subnet, count.index)
    tags = merge(
      var.tags,
      {
      Name = "private_subnet_${count.index}"
    }
    )
}






resource "aws_route_table" "public_route_table" {
    vpc_id = aws_vpc.my_custom_vpc.id
    tags = merge(
      var.tags,{ 
      Name = "public_route_table"
    }
    )
}

resource "aws_route_table_association" "public" {
  count = length(var.az_name)
  subnet_id = element(aws_subnet.public_subnet.*.id, count.index)
  route_table_id = element(aws_route_table.public_route_table.*.id, count.index)
  
}

resource "aws_route" "ingress_route" {
    route_table_id = aws_route_table.public_route_table.id
    destination_cidr_block = var.destination_cidr_public
    gateway_id = aws_internet_gateway.internet-gw.id

  }

  resource "aws_route_table" "private_route_table" {
    vpc_id = aws_vpc.my_custom_vpc.id
    tags = merge(
      var.tags,{
      Name = "private_route_table"
    }
    )
}








resource "aws_route_table_association" "private" {
  count = length(var.az_name)
  subnet_id = element(aws_subnet.private_subnet.*.id, count.index)
  route_table_id = element(aws_route_table.private_route_table.*.id, count.index)
}

 resource "aws_eip" "nat" {
     depends_on = [aws_internet_gateway.internet-gw]
 } 

 resource "aws_nat_gateway" "nat_gateway" {
   allocation_id = aws_eip.nat.id
   subnet_id = aws_subnet.public_1.id
   tags = {
     Name = "nat_gateway"
     ENV = "dev"
     Project = "VPC"
   }
   
 }

 resource "aws_route" "ingress_route_nat_gateway" {
    route_table_id = aws_route_table.private_route_table.id
    destination_cidr_block = var.destination_cidr_public
    
    nat_gateway_id = aws_nat_gateway.nat_gateway.id

  }
