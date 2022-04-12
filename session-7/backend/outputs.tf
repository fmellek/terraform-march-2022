output "db_password" {
    value = random_password.db_password.result
    sensitive = true
  
}

output "db_user" {
    value = aws_db_instance.wordpress.username
  
}