resource "aws_instance" "my_ec2" {
    ami = data.aws_ami.amazon_linux_2.image_id
    instance_type = var.instance_type
    tags = {
      Name = "WordPress-Web"
      ENV = "dev"
      Project = "VPC"
    }
    subnet_id = aws_subnet.public_1.id
    key_name = "Terraform-Server-Key"
    associate_public_ip_address = true
    vpc_security_group_ids = [aws_security_group.my_sg.id]
    user_data = file("web-userdata.sh")

}