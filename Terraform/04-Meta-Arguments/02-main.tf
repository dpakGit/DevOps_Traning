provider "aws" {
  region = "us-east-1"
}


resource "aws_instance" "server" {
  count = 4 # create four similar EC2 instances

  ami = "ami-0cd59ecaf368e5ccf"
  instance_type = "t2.micro"

  tags = {
    Name = "Server ${count.index}"
  }
}
