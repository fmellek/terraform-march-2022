resource "aws_vpc" "my_vpc_east" {
    cidr_block = var.vpc_cidr_block
    instance_tenancy = var.instance_tenancy
    tags = {
        Name = replace(local.name, "rytpe" "my_vpc_east")
        Name2 = local.common_tags
    }
    )
}


