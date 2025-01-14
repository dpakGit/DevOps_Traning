provider "aws" {
  region = "us-east-1"
  alias  = "east1"
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


# Data source for Ubuntu AMI 


data "aws_ami" "ubuntu_north_virginia" { # ami = (data.aws_ami.ubuntu_north_virginia.id)
  provider    = aws.east1
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }
}



data "aws_ami" "ubuntu_ohio" { # ami = (data.aws_ami.ubuntu_ohio.id)

  provider    = aws.east2
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }
}



# Resource Block


resource "aws_instance" "N_Virginia_Frontend" {

  provider          = aws.east1
  ami               = (data.aws_ami.ubuntu_north_virginia.id) # AMI id : Ubuntu Server 24.04
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

  ami = (data.aws_ami.ubuntu_ohio.id)

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
  provider = aws.east1
  ami      = (data.aws_ami.ubuntu_north_virginia.id) # "ami-0e2c8caa4b6378d8c"

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

  ami               = (data.aws_ami.ubuntu_ohio.id) # "ami-00eb69d236edcfaf8"
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


# Output the AMI IDs

output "ubuntu_ami_id_N_Virginia" {
  value = {
    id       = data.aws_ami.ubuntu_north_virginia.id
    image_id = data.aws_ami.ubuntu_north_virginia.image_id
  }
}

output "ubuntu_ami_id_Ohio" {
  value = {
    id       = data.aws_ami.ubuntu_ohio.id
    image_id = data.aws_ami.ubuntu_ohio.image_id
  }

}
