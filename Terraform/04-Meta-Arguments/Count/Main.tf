provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "web" {
  count = 3 # this will create three similar ec2 instances
  ami = "ami-0cd59ecaf368e5ccf"
  instance_type = "t2.micro"
  # count = 3 The count argument can also be declared here in the syntax.
  
  tags = {
    Name = "WebServer-AV"
    Team = "DevOps"
  }
}
