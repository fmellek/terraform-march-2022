resource "aws_instance" "my_ec2" {
    ami = data.aws_ami.amazon_linux_2.image_id
    instance_type = var.instance_type
    tags = {
      Name = var.instance_name
    }
    subnet_id = aws_subnet.public_1.id
    key_name = var.key_name

}