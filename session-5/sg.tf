resource "aws_security_group" "my_sg" {
  name        = "SecurityGroup"
  description = "This is a test security group"
  vpc_id      = "vpc-0b2a4bcf55ca8a7e1"
}

resource "aws_security_group_rule" "ingress_ssh" {
  type              = "ingress" # Hard Coded
  from_port         = 22
  to_port           = 22
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




# Terraform treats this three individual resources because you're defining three individual resources.
# They are totally isolated resources.
# When we use referencing we use attribute not the argument.
# Argument for create, attribute for reference.
# Reference is a dynamic action.
# terraform.tfstate is called backend file.
# terraform.tfstate or backend file keeps track of your infrastructure.
# terraform.tfstate is in charge of keeping Terraform idempotent.
# If your backend terraform.tfstate file is inside of your working directory it's called local terraform.tfstate file.