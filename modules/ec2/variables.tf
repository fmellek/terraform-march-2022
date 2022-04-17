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
variable "s3_bucket_name" {
    type = string
    description = "This represent the s3 bucket name."
  
}