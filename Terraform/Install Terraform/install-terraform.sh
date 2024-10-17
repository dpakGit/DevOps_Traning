#!/bin/bash

# Install Terraform
echo "[TASK 1] Install Base Packages"
apt update
apt install
apt install unzip -y

# Download Terraform
echo "[TASK 2] Install Terraform Packages"
wget https://releases.hashicorp.com/terraform/1.9.7/terraform_1.9.7_linux_amd64.zip
unzip /terraform_1.9.7_linux_amd64.zip 
mv terraform /usr/bin/
chmod +x /usr/bin/terraform
terraform --version
