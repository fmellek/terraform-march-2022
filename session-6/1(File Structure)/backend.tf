terraform {
    backend "s3" {
        bucket = "terraform-march-2022-backend-bucket-fme"
        key = "session-6/dev/terraform.tfstate"
        region = "us-west-1"
        dynamodb_table= "terraform-march-2022-lock"
    }
}