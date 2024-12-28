**Date : - 27.12.2024**


```
variable "ingress_ports" {
  type = list(number)
  default = [ 443, 22, 8080, 9090, 5990 ]
}

variable "egress_ports" {
  type = list(number)
  default = [ 7000, 9000, 9292, 8000 ]
}

resource "aws_security_group" "allow_tls" {
  name        = "dev_sg"

  dynamic "ingress" {
    for_each = var.ingress_ports
    iterator = port
    content {
        description      = "TLS from VPC"
        from_port        = port.value
        to_port          = port.value
        protocol         = "tcp"
        cidr_blocks      = ["98.87.76.56/32"]
    }
  }

  dynamic "egress" {
    for_each = var.egress_ports
    content {
        from_port        = egress.value
        to_port          = egress.value
        protocol         = "tcp"
        cidr_blocks      = ["0.0.0.0/0"]
    }
  }

  tags = {
    Name = "dev_sg"
  }
}
```


**Date : - 28.12.2024**

**Practice-1**

### Following is a Terraform Security Group code that has multiple  ingress and egress blocks.

```
# SG-1

provider "aws" {
  region = "us-east-1"
}


resource "aws_security_group" "allow_tls" {
  name = "allow_tls"

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["11.22.33.44/32"]
  }

  ingress {
    from_port   = 222
    to_port     = 222
    protocol    = "tcp"
    cidr_blocks = ["11.22.33.44/32"]
  }

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["11.22.33.44/32"]
  }

  ingress {
    from_port   = 9090
    to_port     = 9090
    protocol    = "tcp"
    cidr_blocks = ["11.22.33.44/32"]
  }

  ingress {
    from_port   = 5990
    to_port     = 5990
    protocol    = "tcp"
    cidr_blocks = ["11.22.33.44/32"]
  }

  # Egress Block

  egress {
    from_port   = 7000
    to_port     = 7000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 9000
    to_port     = 9000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }

  egress {
    from_port   = 9292
    to_port     = 9292
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }

  egress {
    from_port   = 8000
    to_port     = 8000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }
  tags = {
    Name = "sg_1"
  }
}
```

### Following is the terraform plan output

root@ip-172-31-26-227:/home/ubuntu/sg-1#   terraform plan

```
Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # aws_security_group.allow_tls will be created
  + resource "aws_security_group" "allow_tls" {
      + arn                    = (known after apply)
      + description            = "Managed by Terraform"
      + egress                 = [
          + {
              + cidr_blocks      = [
                  + "0.0.0.0/0",
                ]
              + from_port        = 7000
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "tcp"
              + security_groups  = []
              + self             = false
              + to_port          = 7000
                # (1 unchanged attribute hidden)
            },
          + {
              + cidr_blocks      = [
                  + "0.0.0.0/0",
                ]
              + from_port        = 8000
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "tcp"
              + security_groups  = []
              + self             = false
              + to_port          = 8000
                # (1 unchanged attribute hidden)
            },
          + {
              + cidr_blocks      = [
                  + "0.0.0.0/0",
                ]
              + from_port        = 9000
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "tcp"
              + security_groups  = []
              + self             = false
              + to_port          = 9000
                # (1 unchanged attribute hidden)
            },
          + {
              + cidr_blocks      = [
                  + "0.0.0.0/0",
                ]
              + from_port        = 9292
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "tcp"
              + security_groups  = []
              + self             = false
              + to_port          = 9292
                # (1 unchanged attribute hidden)
            },
        ]
      + id                     = (known after apply)
      + ingress                = [
          + {
              + cidr_blocks      = [
                  + "11.22.33.44/32",
                ]
              + from_port        = 222
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "tcp"
              + security_groups  = []
              + self             = false
              + to_port          = 222
                # (1 unchanged attribute hidden)
            },
          + {
              + cidr_blocks      = [
                  + "11.22.33.44/32",
                ]
              + from_port        = 443
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "tcp"
              + security_groups  = []
              + self             = false
              + to_port          = 443
                # (1 unchanged attribute hidden)
            },
          + {
              + cidr_blocks      = [
                  + "11.22.33.44/32",
                ]
              + from_port        = 5990
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "tcp"
              + security_groups  = []
              + self             = false
              + to_port          = 5990
                # (1 unchanged attribute hidden)
            },
          + {
              + cidr_blocks      = [
                  + "11.22.33.44/32",
                ]
              + from_port        = 8080
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "tcp"
              + security_groups  = []
              + self             = false
              + to_port          = 8080
                # (1 unchanged attribute hidden)
            },
          + {
              + cidr_blocks      = [
                  + "11.22.33.44/32",
                ]
              + from_port        = 9090
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "tcp"
              + security_groups  = []
              + self             = false
              + to_port          = 9090
                # (1 unchanged attribute hidden)
            },
        ]
      + name                   = "allow_tls"
      + name_prefix            = (known after apply)
      + owner_id               = (known after apply)
      + revoke_rules_on_delete = false
      + tags                   = {
          + "Name" = "sg_1"
        }
      + tags_all               = {
          + "Name" = "sg_1"
        }
      + vpc_id                 = (known after apply)
    }

Plan: 1 to add, 0 to change, 0 to destroy.
```

**Console output**

![Screenshot (281)](https://github.com/user-attachments/assets/ec11794c-c833-4899-8b51-860c2194f455)


![Screenshot (282)](https://github.com/user-attachments/assets/c69040cf-7176-47a6-8aed-f2e94c677d52)



**Practice-2**

```
# SG-2

provider "aws" {
  region = "us-east-1"
}


variable "ingress_ports" {
  type    = list(number)
  default = [222, 443, 5990, 8080, 9090]
}

variable "egress_ports" {
  type    = list(number)
  default = [7000, 8000, 9000, 9292]
}

resource "aws_security_group" "allow_tls" {

  name = "dev_sg"


  dynamic "ingress" {
    for_each = var.ingress_ports
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
  dynamic "egress" {
    for_each = var.egress_ports
    iterator = port
    content {
      from_port = port.value
      to_port   = port.value
      protocal  = "tcp"
      cidr      = ["98.87.76.65/32"]
    }
  }
  tags = {
    Name = "dev-sg"
  }
}
```

root@ip-172-31-26-227:/home/ubuntu/sg-2#  terraform plan

```
Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # aws_security_group.allow_tls will be created
  + resource "aws_security_group" "allow_tls" {
      + arn                    = (known after apply)
      + description            = "Managed by Terraform"
      + egress                 = [
          + {
              + cidr_blocks      = [
                  + "98.87.76.65/32",
                ]
              + from_port        = 7000
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "tcp"
              + security_groups  = []
              + self             = false
              + to_port          = 7000
                # (1 unchanged attribute hidden)
            },
          + {
              + cidr_blocks      = [
                  + "98.87.76.65/32",
                ]
              + from_port        = 8000
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "tcp"
              + security_groups  = []
              + self             = false
              + to_port          = 8000
                # (1 unchanged attribute hidden)
            },
          + {
              + cidr_blocks      = [
                  + "98.87.76.65/32",
                ]
              + from_port        = 9000
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "tcp"
              + security_groups  = []
              + self             = false
              + to_port          = 9000
                # (1 unchanged attribute hidden)
            },
          + {
              + cidr_blocks      = [
                  + "98.87.76.65/32",
                ]
              + from_port        = 9292
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "tcp"
              + security_groups  = []
              + self             = false
              + to_port          = 9292
                # (1 unchanged attribute hidden)
            },
        ]
      + id                     = (known after apply)
      + ingress                = [
          + {
              + cidr_blocks      = [
                  + "0.0.0.0/0",
                ]
              + from_port        = 222
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "tcp"
              + security_groups  = []
              + self             = false
              + to_port          = 222
                # (1 unchanged attribute hidden)
            },
          + {
              + cidr_blocks      = [
                  + "0.0.0.0/0",
                ]
              + from_port        = 443
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "tcp"
              + security_groups  = []
              + self             = false
              + to_port          = 443
                # (1 unchanged attribute hidden)
            },
          + {
              + cidr_blocks      = [
                  + "0.0.0.0/0",
                ]
              + from_port        = 5990
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "tcp"
              + security_groups  = []
              + self             = false
              + to_port          = 5990
                # (1 unchanged attribute hidden)
            },
          + {
              + cidr_blocks      = [
                  + "0.0.0.0/0",
                ]
              + from_port        = 8080
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "tcp"
              + security_groups  = []
              + self             = false
              + to_port          = 8080
                # (1 unchanged attribute hidden)
            },
          + {
              + cidr_blocks      = [
                  + "0.0.0.0/0",
                ]
              + from_port        = 9090
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "tcp"
              + security_groups  = []
              + self             = false
              + to_port          = 9090
                # (1 unchanged attribute hidden)
            },
        ]
      + name                   = "dev_sg"
      + name_prefix            = (known after apply)
      + owner_id               = (known after apply)
      + revoke_rules_on_delete = false
      + tags                   = {
          + "Name" = "dev-sg"
        }
      + tags_all               = {
          + "Name" = "dev-sg"
        }
      + vpc_id                 = (known after apply)
    }

Plan: 1 to add, 0 to change, 0 to destroy.
```
