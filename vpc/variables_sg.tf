variable "tag_sg" {
    type = string
    description = "This variable represent the name of the security group"
    default = "WordPress-Web-Security-Group"
  }

variable "sg_ingress_rules" {
    type = list(object({
        from_port = number
        to_port = number
        protocol = string
        cidr_blocks = string
        description = string
    }))
    default = [ {
      cidr_blocks = "0.0.0.0/0"
      description = "test"
      from_port = 22
      protocol = "tcp"
      to_port = 22
    },
    { 
      cidr_blocks = "0.0.0.0/0"
      description = "test"
      from_port = 80
      protocol = "tcp"
      to_port = 80

    },
    ]
  
}

variable "tag_security_group_rule" {
    type = list
    description = "This variable represent the name of the security group rule."
    default = ["ingress", "egress"]
  
}