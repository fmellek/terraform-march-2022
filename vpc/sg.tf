resource "aws_security_group" "my_sg" {
    name = var.tag_sg
    description = "This is a test security group."
    vpc_id = aws_vpc.my_custom_vpc.id
  }

resource "aws_security_group_rule" "ingress" {
    count = length(var.sg_ingress_rules)

    type = var.tag_security_group_rule[0]
    from_port = var.sg_ingress_rules[count.index].from_port
    to_port = var.sg_ingress_rules[count.index].to_port
    protocol = var.sg_ingress_rules[count.index].protocol
    cidr_blocks = [var.sg_ingress_rules[count.index].cidr_blocks]
    description = var.sg_ingress_rules[count.index].description
    security_group_id = aws_security_group.my_sg.id

  }

resource "aws_security_group_rule" "egress" {
  type = var.tag_security_group_rule[1]
  from_port         = 0
  to_port           = 0
  protocol          = "-1" # This is known by aws it means all ports are open either protocol = -1 or protocol = all same thing.
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.my_sg.id 
  
}