## cat main.tf 

 ```
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
```

 ## cat variable.tf 
 
 ```
# Declare variables
variable "image_id" {
  type = string
}

variable "zones" { 
  type = list(string)
  default = ["us-east-1a", "us-east-1b"]
}

variable "myname" {
  type = string
  default = "mydefault-instances"
}
```

## cat testing.tfvars 
```
myname = "Test-EC2"

image_id = "ami-06b21ccaeff8cd686"  # Image name - Amazon Linux 2023 AMI 

zones =        [
  "us-east-1a",
  "us-east-1b",
  "us-east-1c"
]
zones =        [
  "us-east-1a",
  "us-east-1b",
  "us-east-1c"
]
```
