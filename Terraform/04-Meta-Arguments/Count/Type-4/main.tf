provider "aws" {
  region = "us-east-1"
}
variable "subnet_ids" {
  type = list(string)
  default = ["subnet-00a61a9e6b520b487","subnet-03f0ec2d012c72d33"] # Idea of this part I got from here, i.e , adding subnet ids from console : https://github.com/rskTech/terraform/blob/master/06-Variables/exp1-zones/main.tf
}

resource "aws_instance" "EC2" {
  # Create one instance for each subnet
  count = length(var.subnet_ids)

  ami = "ami-0cd59ecaf368e5ccf"
  instance_type = "t2.micro"
  subnet_id = var.subnet_ids[count.index]

  tags = {
    Name = "EC2 -${count.index + 1}"
  }
}
