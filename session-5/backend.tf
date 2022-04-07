terraform {
    backend "s3" {
        bucket = "terraform-march-2022-backend-bucket-fme"
        key = "session5/terraform.tfstate"
        region = "us-west-1"
    }
}

# Remote backend is a plugin. Plugin is a feature. 