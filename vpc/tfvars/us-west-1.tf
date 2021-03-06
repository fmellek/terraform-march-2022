vpc_cidr_block = "10.0.0.0/16"
public_cidr_subnet = [ "10.0.1.0/24", "10.0.2.0/24"]
private_cidr_subnet = ["10.0.11.0/24", "10.0.12.0/24"]
az_name = ["us-west-1a", "us-west-1b"]
destination_cidr_public = "0.0.0.0/0"
instance_type = "t2.micro"
key_name = "Terraform-Server-Key"
sg_ingress_rules = ["22", "80"]
sg_inbound_rules_cidr = "0.0.0.0/0"