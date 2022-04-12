resource "aws_db_instance" "wordpress" {
  allocated_storage    = 10
  engine               = "mysql"
  engine_version       = "5.7"  # key-value takes one equal sign = equality operators take two equal signs. 
  instance_class       = "db.t2.micro"  # condition ? first_val(true) : second_val(false)
  db_name                 = "wordpress"  # Name of my database, not a RDS name.
  username             = "admin"
  password             = random_password.db_password.result
 
  skip_final_snapshot  = var.env == "dev" ? true : false
  final_snapshot_identifier = var.env == "dev" ? null : "${var.env}-db-snapshot"  # snapshot name
  identifier = "${var.env}-rds-instance" # Name of your RDS instance, not your database. 
  publicly_accessible = var.env == "dev" ? true : false 
}