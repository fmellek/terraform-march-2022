resource "aws_lb_target_group" "target_group" {
    tags = merge(
        local.common_tags,{
            Name = replace(local.name, "rtype", "lb_tg")
        }
    )
    target_type = "ip"
    protocol = "HTTP"
    port = 80
    vpc_id = var.vpc_id
    protocol_version = "HTTP1"
}