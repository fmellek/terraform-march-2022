# This feature is called data sourcing the remote backend
# Data source only fetches the from outputs

data "terraform_remote_state" "backend" {
    backend = "s3"
    config = {
         bucket = "terraform-march-2022-backend-bucket-fme"
        key = "session-7/backend/terraform.tfstate"
        region = "us-west-1"
    }
}


output "password" {
    value = data.terraform_remote_state.backend.outputs.db_password
  
} # output from the output

output "username" {
    value = data.terraform_remote_state.backend.outputs.db_user
  
}

# locals {
#    name = "aws-${var.stage}-${var.region}-${var.env}-${var.project}-rtype"
# common_tags = {
#    ENV = var.env
 #   PROJECT = var.project
  #  TEAM = "CLOUD"
   # OWNER = "FME"
    #Managed_by= "Terraform"}
# }

