
provider "aws" {
  alias  = "east"
  region = "us-east-2"
}


data "aws_vpc" "Demo-VPC" {
id = "vpc-010c7bdb982b2d359"

}

resource "aws_security_group" "sg-2" {
 name        = "web-server-sg-tf-2"
 description = "Allow HTTPS to web server"
 vpc_id      = data.aws_vpc.Demo-VPC.id

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
   Name = "Hello_World_Security_Group-2"
  }
}
