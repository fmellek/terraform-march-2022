resource "aws_security_group" "my_sg" {
    name = "WordPress-Web-Security-Group"
    description = "This is a test security group."
    vpc_id = aws_vpc.my_custom_vpc.id
  }

resource "aws_security_group_rule" "ingress" {
    count = length(var.sg_ingress_rules) #length will count how many string, number that I have in a list.
    
    

    type = "ingress"
    from_port = element(var.sg_ingress_rules, count.index)
    to_port = element(var.sg_ingress_rules, count.index)
    protocol = "tcp"
    cidr_blocks = [var.sg_inbound_rules_cidr]
    description = "This is the inbound rules."
    security_group_id = aws_security_group.my_sg.id

  }

resource "aws_security_group_rule" "egress" {
  type = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1" # This is known by aws it means all ports are open either protocol = -1 or protocol = all same thing.
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.my_sg.id 
  
}