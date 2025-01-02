provider "aws" {
 region = "us-east-1"
}

resource "aws_instance" "webs" {
 count             = length(var.zones)
 ami = var.image_id
 instance_type = "t2.micro"
 availability_zone = var.zones[count.index]

 tags = {
   Name = "${join("-", tolist([var.myname]))}-${count.index+1}"
   Team = "DevOps"
 }

}
