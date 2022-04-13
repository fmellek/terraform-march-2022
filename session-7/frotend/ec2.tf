resource "aws_instance" "instance_1" {
    ami = var.ami
    instance_type = var.instance_type
    tags = merge(
        local.common_tags, {
            Name = replace(local.name, "rtype", "first_instance")
        }
    )
    key_name = var.key_name
    associate_public_ip_address = true 
    vpc_security_group_ids = [var.security_group_id]

  
}

resource "aws_instance" "instance_2" {
    ami = var.ami
    instance_type = var.instance_type
    tags = merge(
        local.common_tags, {
            Name = replace(local.name, "rtype", "second_instance")
        }
    )
    key_name = var.key_name
    associate_public_ip_address = true 
    vpc_security_group_ids = [var.security_group_id]
    
  
}

resource "aws_instance" "instance_3" {
    ami = var.ami
    instance_type = var.instance_type
    tags = merge(
        local.common_tags, {
            Name = replace(local.name, "rtype", "third_instance")
        }
    )
    key_name = var.key_name
    associate_public_ip_address = true 
    vpc_security_group_ids = [var.security_group_id]
    
  
}