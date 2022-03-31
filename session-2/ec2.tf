resource "aws_instance" "first_ec2" {
  ami           = "ami-04a50faf2a2ec1901" # String, whenever you hard code the values, it uses double quatations.
  instance_type = "t2.micro"
  tags = {
    Name        = "SecondVersionofEC2"
    Environment = "dev"
  }
  security_groups = ["default"]
  key_name        = "mackey"
}



# Each block has its own functionality.
# Resource block is designed to create resources. Data source is designed to fetch to data from existing resources.
# Each block expects 2 labels.
# The first label is predefined by Terraform. It indicates what resources you would like to create.
# The second label is by the Author. It indicates the Logical Name or Logical ID for the resources.
# Every single resources has to have unique logical name or ID
# Terraform doesn't really care about spaces or indentetion
# Terraform works within a directory. We call it Working Directory.You isolated terraform with directories.
# String = Whatever you see on your keyboard.
# String size is bigger than number size.
# When it's dynamic value you don't put double quatations instead of hardcoding.
# [] = list it needs to be consistent.
# Whenever it's a mapping curly {}, whenever you see plural that's [] square.
# Terraform init is the first comment you need to run.You can run as many as you want because it's idompotent.
# 