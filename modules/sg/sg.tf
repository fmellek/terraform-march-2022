resource "aws_security_group" "main" {
    name = format("%s-instance-sg", var.env)
    description = "This is a security group for my ec2"

    # Dynamic Block was implemented Terraform Version 0.12 
    dynamic "ingress" {   # Instead of using element function you can go head and use dynamic block.
        for_each = var.ports
        content {
            from_port = ingress.value.from_port
            to_port =  ingress.value.to_port
            protocol = ingress.value.protocol
            cidr_blocks = ingress.value.cidr_blocks
            
        }
    }
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
  
}