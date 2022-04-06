output "my_ec2_public_ip" {
    value = aws_instance.my_ec2.public_ip
}

output "my_ec2_instance_state" {
    value = aws_instance.my_ec2.instance_state
}