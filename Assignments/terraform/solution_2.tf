#  Code - Ami hardcoded

provider "aws" {
  region = "us-east-1"
}

provider "aws" {
  region = "us-east-2"
  alias  = "east2"
}


variable "zones_north_virginia" {
  default = ["us-east-1a", "us-east-1b"]
}

variable "zones_ohio" {
  default = ["us-east-2a", "us-east-2b"]
}

# Note: AMI Ids for N. Virginia and Ohio are different for same AMIs

resource "aws_instance" "N_Virginia_Frontend" {

  ami               = "ami-0e2c8caa4b6378d8c" # AMI id : Ubuntu Server 24.04
  instance_type     = "t2.micro"
  availability_zone = var.zones_north_virginia[count.index]

  count = length(aws_instance.N_Virginia_Backend)

  depends_on = [aws_instance.N_Virginia_Backend]

  lifecycle {
    create_before_destroy = true
  }

  tags = {
    Name = "N_Virginia_Frontend-${element(var.zones_north_virginia, count.index)}"
    Team = "DevOps"
  }
}



resource "aws_instance" "Ohio_Frontend" {

  provider = aws.east2

  ami = "ami-00eb69d236edcfaf8"

  instance_type     = "t2.micro"
  availability_zone = var.zones_ohio[count.index]


  count = length(aws_instance.Ohio_Backend)

  depends_on = [aws_instance.Ohio_Backend]

  lifecycle {
    create_before_destroy = true
  }

  tags = {
    Name = "Ohio_Frontend-${element(var.zones_ohio, count.index)}"

    Team = "DevOps"
  }
}



resource "aws_instance" "N_Virginia_Backend" {
  ami               = "ami-0e2c8caa4b6378d8c"
  instance_type     = "t2.micro"
  availability_zone = var.zones_north_virginia[count.index]

  count = 2

  lifecycle {
    prevent_destroy = false
  }

  tags = {
    Name = "N_Virginia_Backend-${element(var.zones_north_virginia, count.index)}"

    Team = "DevOps"
  }
}



resource "aws_instance" "Ohio_Backend" {
  provider = aws.east2

  ami               = "ami-00eb69d236edcfaf8"
  instance_type     = "t2.micro"
  availability_zone = var.zones_ohio[count.index]


  count = 2

  lifecycle {
    prevent_destroy = false
  }

  tags = {
    Name = "Ohio_Backend-${element(var.zones_ohio, count.index)}"

    Team = "DevOps"
  }
}

output "PublicIP_N_Virginia_Frontend" {
  value = aws_instance.N_Virginia_Frontend.*.public_ip
}

output "PublicIP_N_Virginia_Backend" {
  value = aws_instance.N_Virginia_Backend.*.public_ip
}
