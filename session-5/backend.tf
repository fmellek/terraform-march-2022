terraform {
    backend "s3" {
        bucket = "terraform-march-2022-backend-bucket-fme"
        key = "session5/terraform.tfstate"
        region = "us-west-1"
        dynamodb_table= "terraform-march-2022-lock"
    }
}

# Remote backend is a plugin. Plugin is a feature. 
# You cannot pass or use any variables for Backend Configuration.
# backend.tf, providers.tf, versions.tf are must. 
# We use Terraform Lock. Whoever runs the terraform apply first Terraform lock that apply process till the execution done. We use DynamoDB table to lock. 
# terraform init -reconfigure is configuring your infrastructure. 