resource "aws_instance" "my_ec2" {        # if you're using "_" always use "_" 
  count = 1
  ami           =  data.aws_ami.amazon_linux_2.image_id # String, Hard Coded Value # var = variable, variable name
  instance_type = var.instance_type
  tags = {
    Name = replace(local.name, "rtype", "ec2") 
    Tags = local.common_tags  
  }
  vpc_security_group_ids = [aws_security_group.my_sg.id]
  user_data = file("user_data.sh")
} 