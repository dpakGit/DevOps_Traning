
```
provider "aws" {
  region = "us-east-1"
}


resource "aws_instance" "web" { 
  ami = "ami-0cd59ecaf368e5ccf"
  instance_type = "t2.micro"
} 
resource "aws_security_group" "ec2_sg" {
  name        = "allow_http"
  description = "Allow http inbound traffic"
  vpc_id      = "vpc-01d8b434f2e21ccaf"

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }
  tags = {
    Name = "terraform-ec2-security-group"
  }
}
```

root@ip-172-31-88-42:/usr/bin/second# vi main.tf
root@ip-172-31-88-42:/usr/bin/second# terraform plan
aws_security_group.ec2_sg: Refreshing state... [id=sg-0ada029013bca1ce1]
aws_instance.web: Refreshing state... [id=i-0af564cd8cd2db3f3]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  ~ update in-place

Terraform will perform the following actions:

  # aws_instance.web will be updated in-place
  ~ resource "aws_instance" "web" {
        id                                   = "i-0af564cd8cd2db3f3"
      ~ tags                                 = {
          + "Name" = "EC2-SG"
          + "Team" = "DevOps"
        }
      ~ tags_all                             = {
          + "Name" = "EC2-SG"
          + "Team" = "DevOps"
        }
        # (38 unchanged attributes hidden)

        # (8 unchanged blocks hidden)
    }

Plan: 0 to add, 1 to change, 0 to destroy.

────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

Note: You didn't use the -out option to save this plan, so Terraform can't guarantee to take exactly these actions if you run "terraform apply"
now.
root@ip-172-31-88-42:/usr/bin/second# terraform apply 
aws_instance.web: Refreshing state... [id=i-0af564cd8cd2db3f3]
aws_security_group.ec2_sg: Refreshing state... [id=sg-0ada029013bca1ce1]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # aws_instance.web will be created
  + resource "aws_instance" "web" {
      + ami                                  = "ami-0cd59ecaf368e5ccf"
      + arn                                  = (known after apply)
      + associate_public_ip_address          = (known after apply)
      + availability_zone                    = (known after apply)
      + cpu_core_count                       = (known after apply)
      + cpu_threads_per_core                 = (known after apply)
      + disable_api_stop                     = (known after apply)
      + disable_api_termination              = (known after apply)
      + ebs_optimized                        = (known after apply)
      + get_password_data                    = false
      + host_id                              = (known after apply)
      + host_resource_group_arn              = (known after apply)
      + iam_instance_profile                 = (known after apply)
      + id                                   = (known after apply)
      + instance_initiated_shutdown_behavior = (known after apply)
      + instance_lifecycle                   = (known after apply)
      + instance_state                       = (known after apply)
      + instance_type                        = "t2.micro"
      + ipv6_address_count                   = (known after apply)
      + ipv6_addresses                       = (known after apply)
      + key_name                             = (known after apply)
      + monitoring                           = (known after apply)
      + outpost_arn                          = (known after apply)
      + password_data                        = (known after apply)
      + placement_group                      = (known after apply)
      + placement_partition_number           = (known after apply)
      + primary_network_interface_id         = (known after apply)
      + private_dns                          = (known after apply)
      + private_ip                           = (known after apply)
      + public_dns                           = (known after apply)
      + public_ip                            = (known after apply)
      + secondary_private_ips                = (known after apply)
      + security_groups                      = (known after apply)
      + source_dest_check                    = true
      + spot_instance_request_id             = (known after apply)
      + subnet_id                            = (known after apply)
      + tags                                 = {
          + "Name" = "EC2-SG"
          + "Team" = "DevOps"
        }
      + tags_all                             = {
          + "Name" = "EC2-SG"
          + "Team" = "DevOps"
        }
      + tenancy                              = (known after apply)
      + user_data                            = (known after apply)
      + user_data_base64                     = (known after apply)
      + user_data_replace_on_change          = false
      + vpc_security_group_ids               = (known after apply)
    }

Plan: 1 to add, 0 to change, 0 to destroy.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

aws_instance.web: Creating...
aws_instance.web: Still creating... [10s elapsed]
aws_instance.web: Still creating... [20s elapsed]
aws_instance.web: Still creating... [30s elapsed]
aws_instance.web: Creation complete after 32s [id=i-0f2e60caa2849395d]

Apply complete! Resources: 1 added, 0 changed, 0 destroyed.
root@ip-172-31-88-42:/usr/bin/second# cat main.tf 
# This is a Ubuntu Server 20.04 LTS (HVM), SSD Volume Type

provider "aws" {
  region = "us-east-1"
}


resource "aws_instance" "web" { 
  ami = "ami-0cd59ecaf368e5ccf"
  instance_type = "t2.micro"
tags = {
   Name = "EC2-SG"
   Team = "DevOps"
  }
} 
resource "aws_security_group" "ec2_sg" {
  name        = "allow_http"
  description = "Allow http inbound traffic"
  vpc_id      = "vpc-01d8b434f2e21ccaf"

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }
  tags = {
    Name = "terraform-ec2-security-group"
  }
}
