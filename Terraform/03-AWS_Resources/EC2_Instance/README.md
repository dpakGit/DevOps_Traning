Breakdown of the main.tf Configuration File :

This Terraform configuration file consists of two main sections:

**Provider Configuration**: This section specifies the cloud provider and the region where you want to deploy your resources. In this example, we’re using AWS as the provider and specifying the region as us-east-1.

**Resource Configuration**: This section describes the AWS resources you want to create. Here, we’re creating an EC2 instance using the aws_instance resource. We specify the AMI ID of the instance, the instance type, and any additional configurations such as tags.


Source: MetaAi

If we want to create the following instance in two different regions like us-east-1a and us-east-1b,how can we achieve it.  provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "web" { 
  ami = "ami-0cd59ecaf368e5ccf"
  instance_type = "t2.micro"
  
 tags = { 
   Name = "HelloWorld"
   Team = "DevOps"
  } 
}


To create instances in multiple regions, you can use Terraform's built-in features:

Method 1: Provider Aliases

Create separate provider blocks with aliases for each region:


terraform
provider "aws" {
  alias  = "east1"
  region = "us-east-1"
}

provider "aws" {
  alias  = "east1b"
  region = "us-east-1"
  # Note: us-east-1b is an Availability Zone, not a region.
  # Terraform will automatically use us-east-1 for the region.
}

resource "aws_instance" "web_east1" {
  provider = aws.east1
  ami           = "ami-0cd59ecaf368e5ccf"
  instance_type = "t2.micro"
  availability_zone = "us-east-1a"
  tags = {
    Name = "HelloWorld"
    Team = "DevOps"
  }
}

resource "aws_instance" "web_east1b" {
  provider = aws.east1b
  ami           = "ami-0cd59ecaf368e5ccf"
  instance_type = "t2.micro"
  availability_zone = "us-east-1b"
  tags = {
    Name = "HelloWorld"
    Team = "DevOps"
  }
}


Method 2: Modules

Create a separate module for the instance and call it twice with different regions:

// File: modules/instance/(link unavailable)

terraform
resource "aws_instance" "web" {
  ami           = var.ami
  instance_type = var.instance_type
  availability_zone = var.availability_zone
  tags = {
    Name = var.name
    Team = var.team
  }
}


// File: (link unavailable)

terraform
provider "aws" {
  region = "us-east-1"
}

module "east1" {
  source = file("./modules/instance")

  ami           = "ami-0cd59ecaf368e5ccf"
  instance_type = "t2.micro"
  availability_zone = "us-east-1a"
  name        = "HelloWorld"
  team        = "DevOps"
}

module "east1b" {
  source = file("./modules/instance")

  ami           = "ami-0cd59ecaf368e5ccf"
  instance_type = "t2.micro"
  availability_zone = "us-east-1b"
  name        = "HelloWorld"
  team        = "DevOps"
}


Method 3: count and for_each

Use Terraform's built-in count or for_each arguments:


terraform
provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "web" {
  count = 2

  ami           = "ami-0cd59ecaf368e5ccf"
  instance_type = "t2.micro"
  availability_zone = count.index == 0 ? "us-east-1a" : "us-east-1b"
  tags = {
    Name = "HelloWorld"
    Team = "DevOps"
  }
}


Choose the method that best fits your needs!

