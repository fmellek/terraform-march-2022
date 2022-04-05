resource "aws_instance" "my_ec2" {        # if you're using "_" always use "_" 
  ami           =  data.aws_ami.amazon_linux_2.image_id # String, Hard Coded Value # var = variable, variable name
  instance_type = var.instance_type
  tags = {
    Name = "${var.env}-app-instance"             #s syntax may change. ${variable}
    Name2 = format("%s-app-instance", var.env)   # syntax will never change
  }
  vpc_security_group_ids = [aws_security_group.my_sg.id]
} 

# Combine static and dynamic values together. 
# Name = dev-app-instance, qa-app-instance, prod-app-instance
# ${} was supported with every single reference befor Terraform Version 0.12
# They got rid of ${} after 0.12