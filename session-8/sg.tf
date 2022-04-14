resource "aws_security_group" "my_sg" {
  name        = replace(local.name, "rtype", "web-sg")
  description = "This is a test security group"
  vpc_id      = "vpc-0b2a4bcf55ca8a7e1"
  tags = merge(
    local.common_tags,
    {
    Name = replace(local.name, "rtype", "web-sg")
    }
    )
}

resource "aws_security_group_rule" "ingress_ssh" {
  
  type              = "ingress" # Hard Coded
  from_port         = 22
   to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.my_sg.id # first_label.second_label.attribute
}
resource "aws_security_group_rule" "ingress_web" {
  
  type              = "ingress" # Hard Coded
  from_port         = 80
   to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.my_sg.id # first_label.second_label.attribute
}

resource "aws_security_group_rule" "egress" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1" # This is known by aws it means all ports are open either protocol = -1 or protocol = all same thing.
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.my_sg.id # no double quatation because it's a dynamic action.
}