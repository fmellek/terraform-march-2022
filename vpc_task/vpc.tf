resource "aws_vpc" "my_vpc_east" {
    cidr_block = var.vpc_cidr_block
    instance_tenancy = var.instance_tenancy
    tags = 
     {
        replace(local.name, "rytpe" "my_vpc_east")
        Name = local.common_tags
    }
    )
}


