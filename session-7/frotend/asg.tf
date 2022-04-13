resource "aws_lb_target_group" "target_group" {
   
    
    name = replace(local.name, "rtype", "lb-tg")
    target_type = "ip"
    protocol = "HTTP"
    port = 80
    vpc_id = var.vpc_id
    protocol_version = "HTTP1"
}

resource "aws_lb" "application_lb" {
    count = length(var.subnet_ids)
    load_balancer_type = "application"
    name = replace(local.name, "rtype", "application-lb")
    internal = false 
    ip_address_type = "ipv4"
    subnets = [for subnet in element(var.subnet_ids, count.index) : subnet_id]
    vpc_security_group_ids = [var.security_group_id]
  
}