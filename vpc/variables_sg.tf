

variable "sg_ingress_rules" { 
    type = list(string)
    description = "This variable represent list of ports for inbound rule"
    default = [ "22", "80" ]

}
variable "sg_inbound_rules_cidr" {
    type = list(string)
    description = "This variable represent list of CIDR ranges for inbound rules"
    default = [ "0.0.0.0/0", "0.0.0.0/0" ]
  
}

