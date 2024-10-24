# Creating an ec2 instance using for_each

provider "aws" {
  region = "us-east-1"
}


resource "aws_instance" "sandbox" {
  ami = "ami-0cd59ecaf368e5ccf"
  instance_type = "t2.micro"
 
  for_each = toset(["sandbox_one", "sandbox_two", "sandbox_three"])
 
tags = {
    Name = each.value   # for a set, each.value and each.key is the same, we can also write each.key in place of each.value
  }
}
