resource "aws_instance" "web" {
  count = 2
  ami           = "ami-005fc0f236362e99f"
  instance_type = "t2.micro"
  availability_zone = var.zones[count.index]

  tags = {
    Name = "${join("-", tolist([var.myname]))}-${count.index}"
    Team = "DevOps"
  }

}