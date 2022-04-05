resource "aws_vpc" "my_custom_vpc" {
    tags = {
        Name = var.tag
    }
    cidr_block = var.cidr_block
    tenancy = var.tenancy
}