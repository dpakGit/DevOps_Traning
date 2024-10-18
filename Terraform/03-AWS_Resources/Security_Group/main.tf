# https://spacelift.io/blog/terraform-security-group

# See the AWS VPC and security group console screenshots in the README.md 

provider "aws" {
  region = "us-east-1"
}

data "aws_vpc" "default" {
 default = true
}

resource "aws_security_group" "sg" {
 name        = "web-server-sg-tf"
 description = "Allow HTTPS to web server"
 vpc_id      = data.aws_vpc.default.id

ingress {
   description = "HTTPS ingress"
   from_port   = 443
   to_port     = 443
   protocol    = "tcp"
   cidr_blocks = ["0.0.0.0/0"]
 }

egress {
   from_port   = 0
   to_port     = 0
   protocol    = "-1"
   cidr_blocks = ["0.0.0.0/0"]
 }
tags = {
   Name = "Hello_World_Security_Group"
  }
}

