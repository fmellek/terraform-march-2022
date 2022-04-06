resource "aws_security_group" "my_sg" {
    name = var.tag_sg
    description = "This is a test security group."
    vpc_id = aws_vpc.my_custom_vpc.id
  }