#!/bin/bash
  sudo yum install httpd -y
  sudo systemctl start httpd
  sudo systemctl enable httpd
  sudo echo 'Hello World' > /var/www/html/index.html
  sudo echo 'from ec2' >> /var/www/html/index.html