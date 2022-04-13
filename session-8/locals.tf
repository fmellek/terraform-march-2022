# reusable values
#There are really common 2 things
# 1: Naming Standard
# 2: Tagging Standard

locals {
  region = "us-west-1"
  stage = "non-prod"
  project = "provisioner"
  name = "aws-${local.stage}-${local.region}-${local.project}-rtype-${var.env}"  #naming standard which will be used by every single resources.
  common_tags = {
      env = var.env 
      project = local.project
      team = "Cloud"
      owner = "Fatih"
      managed_by = "Terraform"
  }
}