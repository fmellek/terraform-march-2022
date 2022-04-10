resource "aws_instance" "web" {
    ami = var.ami
    instance_type = var.instance_type
    vpc_security_group_ids = [aws_security_group.web_sg.id]
    tags= {
        Name = format("%s-instance", var.env)
    }
}

resource "aws_security_group" "web_sg" {
    name = format("%s-web-sg", var.env)
    description = "This is a security group for my web instance."
  }

resource "aws_security_group_rule" "web_sg_rule" {
    count = length(var.web_sg_ports)
    type = "ingress"
    from_port = element(var.web_sg_ports, count.index)
    to_port = element(var.web_sg_ports, count.index)
    protocol = "tcp"
    cidr_blocks = [element(var.web_sg_ports_cidr, count.index)]
    security_group_id = aws_security_group.web_sg.id
  
}

resource "aws_security_group_rule" "web_sg_rule_egress" {
    type = "egress"
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = [ "0.0.0.0/0" ]
    security_group_id = aws_security_group.web_sg.id
  }