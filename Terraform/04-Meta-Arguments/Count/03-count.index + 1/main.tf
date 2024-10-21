# "Server-${count.index + 1}" - Starts the server name from 1 and not fron zero

provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "example" {

  count = 3

  ami           = "ami-123456"
  
  instance_type = "t2.micro"
  
  tags = {
      Name = "Server-${count.index + 1}"  # Uses count.index to create unique names
   
  }
  
}
