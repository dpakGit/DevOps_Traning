#  Code-1  - NEW - Version - 1 - Ami hardcoded


provider "aws" {
  region = "us-east-1"
}

provider "aws" {
  region = "us-east-2"
  alias  = "east2"
}

variable "zones_east-1" { #  Zone-1    :  N.Virginia               
  default = ["us-east-1a", "us-east-1b"]
}

variable "zones_east-2" {
  default = ["us-east-2a", "us-east-2b"]
}

# Frontend and Backend Instances to be created in the US East 1 (N. Virginia) region.


resource "aws_instance" "Backend-East-1" { 
  ami               = "ami-0e2c8caa4b6378d8c" 
  instance_type     = "t2.micro"
  availability_zone = var.zones_east-1[count.index]
  count             = 2

  lifecycle {
    prevent_destroy = false
  }

  tags = {
    Name = "Backend-East-1-${count.index + 1}" # Also we can name it as "Backend_N.Virginia-${count.index + 1}" or Baknd_N.Virginia               
    Team = "DevOps"
  }
}



resource "aws_instance" "Frontend-East-1" {
  ami               = "ami-0e2c8caa4b6378d8c" # AMI : Ubuntu Server 24.04 LTS (HVM),EBS General Purpose (SSD) Volume Type
  instance_type     = "t2.micro"
  availability_zone = var.zones_east-1[count.index]

  count = length(aws_instance.Backend-East-1)

  depends_on = [aws_instance.Backend-East-1]

  lifecycle {
    create_before_destroy = true
  }

  tags = {
    Name = "Frontend-East-1-${count.index + 1}"
    Team = "DevOps"
  }
}

# Frontend and Backend Instances to be created in the US East 2 (Ohio) region.

resource "aws_instance" "Backend-East-2" {
  provider = aws.east2

  ami               = "ami-00eb69d236edcfaf8"
  instance_type     = "t2.micro"
  availability_zone = var.zones_east-2[count.index]

  count = 2

  lifecycle {
    prevent_destroy = false
  }

  tags = {
    Name = "Backend-East-2-${count.index + 1}" # "Backend_Ohio-${count.index + 1}"
    Team = "DevOps"
  }
}



resource "aws_instance" "Frontend-East-2" {
  provider = aws.east2

  ami = "ami-00eb69d236edcfaf8"

  instance_type     = "t2.micro"
  availability_zone = var.zones_east-2[count.index]

  count = length(aws_instance.Backend-East-2)

  depends_on = [aws_instance.Backend-East-2]

  lifecycle {
    create_before_destroy = true
  }

  tags = {
    Name = "Frontend-East-2-${count.index + 1}"
    Team = "DevOps"
  }
}
