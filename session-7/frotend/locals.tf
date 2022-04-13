locals {
    name = "aws-${var.stage}-${var.region}-${var.env}-${var.project}-rtype"
    common_tags = {
        env = var.env
        PRJOECT = var.project
        TEAM = "Cloud"
        OWNER = "FME"
        Managed_by = "Terraform"
    }
}