resource "aws_instance" "my_ec2" {        # if you're using "_" always use "_" 
  count = 1
  ami           =  data.aws_ami.amazon_linux_2.image_id # String, Hard Coded Value # var = variable, variable name
  instance_type = var.instance_type
  tags = merge(
    local.common_tags,
    {
    Name = replace(local.name, "rtype", "web-ec2") 
     }
     )
  vpc_security_group_ids = [aws_security_group.my_sg.id]
  key_name = aws_key_pair.terraform_server.key_name

  provisioner "file" {
    source = "/home/ec2-user/terraform-march-2022/session-8/index.html" # Where does your file exist? Your Terraform Server
    destination = "/tmp/index.html" # This is the remote server
    
    connection {
      type = "ssh"
      user = "ec2-user"
      host = self.public_ip
      private_key = file("~/.ssh/id_rsa")       # Private key of my Terraform Server
    }
  
  }
 
} 
resource "aws_key_pair" "terraform_server" {
  key_name = replace(local.name, "rtype", "terraform_server_key")
  public_key = file("~/.ssh/id_rsa.pub")
}