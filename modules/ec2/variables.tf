variable "ami" {
    type = string
    description = "This is AMI for my EC2 instance"
}
variable "instance_type" {
    type = string
    description = "This is a size of my EC2 instance"
}
variable "env" {
    type = string
    description = "This represents the environment"
}

variable "project" {
    type = string
    description = "This represents the project"
}
variable "security_group_ids" {
    type = list
    description = "A list of security group"
  
}