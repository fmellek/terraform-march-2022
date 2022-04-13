variable "stage" {
    type = string
    default = "prod"
  }

  variable "region" {
      type = string
      default = "us-west-1"
    }

    variable "env" {
        type = string
        default = "dev"
      }
      variable "project" {
          type = string
          default = "asg"
        }

        variable "ami" {
            type = string
            default = "ami-04a50faf2a2ec1901"
          
        }
        variable "instance_type" {
            type = string
            default = "t2.micro"
          
        }
        variable "key_name" {
            type = string
            default = "Terraform-Server-Key"
          
        }
        variable "security_group_id" {
            type = string
            default = "sg-0b871eb3755c686db"
          
        }
        