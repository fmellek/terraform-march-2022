variable "instance_type" {
    type = string 
    description = "Capacity"
    default = "t2.micro"
}


variable "key_name" {
    type = string
    description = "This variable represent the name of the key-pair"
    default = "Terraform-Server-Key"
  }