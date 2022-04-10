#!/bin/bash
sudo rm -rf .terraform*
ENV = "$1"
sed -i ' ' -e "s|_env_|$ENV|" backend.tf 
terraform init
echo 'Environment is set to $ENV'
terraform plan -var-file=tfvars/$ENV.tf
terraform apply -var-file=tfvars/$ENV.tf -auto-approve
sed -i ' ' -e "s|_env_|$ENV|" backend.tf 
