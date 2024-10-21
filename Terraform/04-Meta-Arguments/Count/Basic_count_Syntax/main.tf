provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "web" { 
  count = 2                      # Create two similar EC2 instances
  ami = "ami-0cd59ecaf368e5ccf"
  instance_type = "t2.micro"
# count = 2 Count argument can also be written here in the syntax
  
 tags = { 
   Name = "HelloWorld"
   Team = "DevOps"
  } 
}
