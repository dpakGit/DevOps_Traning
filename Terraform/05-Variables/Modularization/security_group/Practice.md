**Practice-1**


```
resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"

  ingress {
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
 cidr_blocks      = ["11.22.33.44/32"]
    
  }

  

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_tls"
  }
}

```

**Practice-2**

```
resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"

  ingress {
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["11.22.33.44/32"]
  }

  ingress {
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["11.22.33.44/32"]
  }

  ingress {
    from_port        = 8080
    to_port          = 8080
    protocol         = "tcp"
    cidr_blocks      = ["11.22.33.44/32"]
  }

  ingress {
    from_port        = 9090
    to_port          = 9090
    protocol         = "tcp"
    cidr_blocks      = ["11.22.33.44/32"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_tls"
  }
}

```

Error: Incorrect attribute value type
│ 
│   on main.tf line 8, in resource "aws_security_group" "allow_tls":
│    8:     cidr_blocks      = "11.22.33.44/32"
│ 
│ Inappropriate value for attribute "cidr_blocks": list of string required.
╵
╷
│ Error: Incorrect attribute value type
│ 
│   on main.tf line 15, in resource "aws_security_group" "allow_tls":
│   15:     cidr_blocks      = "11.22.33.44/32"
│ 
│ Inappropriate value for attribute "cidr_blocks": list of string required.
╵
╷
│ Error: Incorrect attribute value type
│ 
│   on main.tf line 22, in resource "aws_security_group" "allow_tls":
│   22:     cidr_blocks      = "11.22.33.44/32"
│ 
│ Inappropriate value for attribute "cidr_blocks": list of string required.
╵
╷
│ Error: Incorrect attribute value type
│ 
│   on main.tf line 29, in resource "aws_security_group" "allow_tls":
│   29:     cidr_blocks      = "11.22.33.44/32"
│ 
│ Inappropriate value for attribute "cidr_blocks": list of string required.


**Solution:**

The following isthe right syntax to write the code :

 cidr_blocks      = ["11.22.33.44/32]"  , use the brackets.




**Practice-3**  date 29.11.2024

root@ip-172-31-19-195:/home/labsuser/variable# terraform init
Terraform initialized in an empty directory!                   # Got this error as provider file was not created

The directory has no Terraform configuration files. You may begin working
with Terraform immediately by creating Terraform configuration files.
root@ip-172-31-19-195:/home/labsuser/variable# terraform --version
Terraform v1.9.8
on linux_amd64
root@ip-172-31-19-195:/home/labsuser/variable# vi provider.tf
root@ip-172-31-19-195:/home/labsuser/variable# terraform init
Initializing the backend...
Initializing provider plugins...
- Finding latest version of hashicorp/aws...
- Installing hashicorp/aws v5.78.0...
- Installed hashicorp/aws v5.78.0 (signed by HashiCorp)
Terraform has created a lock file .terraform.lock.hcl to record the provider
selections it made above. Include this file in your version control repository
so that Terraform can guarantee to make the same selections by default when
you run "terraform init" in the future.

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.



root@ip-172-31-19-195:/home/labsuser/variable# terraform apply -var="cidr=11.22.33.44/32"
╷
│ Error: Value for undeclared variable
│ 
│ A variable named "cidr" was assigned on the command line, but the root module does not declare a variable of that name. To use this value, add a "variable" block to the
│ configuration.


**Error:**
root@ip-172-31-19-195:/home/labsuser/variable# t plan

Planning failed. Terraform encountered an error while generating this plan.

╷
│ Error: "" is not a valid CIDR block: invalid CIDR address: 
│ 
│   with aws_security_group.allow_tls,
│   on securitygroup.tf line 1, in resource "aws_security_group" "allow_tls":
│    1: resource "aws_security_group" "allow_tls" {
│ 

...................

variable "cidr" {    # the above error as i have kept the variable name inside double colons / "" -> "cidr"
  default = ["33.44.55.66/32"]
}



**Practice**  Date - 1.12.2024

**Data_Types - Numbers**

Files: ec2.tf  provider.tf  sg.tf  variable.tf

```
root@ip-172-31-30-202:/home/ubuntu# ls
LICENSE.txt  ec2.tf  provider.tf  sg.tf  terraform.tfstate  terraform_1.9.8_linux_amd64.zip  variable.tf
root@ip-172-31-30-202:/home/ubuntu# cat ec2.tf sg.tf variable.tf


vi variable.tf

variable instance_name {}

variable port-1 {
description = "Enter a number for port-1"
type = number
}

variable port-2 {
type = number
}

variable port-3 {
type = number
}

variable port-4 {
type = number
}



resource "aws_instance" "Web" {
  ami           = "ami-005fc0f236362e99f"
  instance_type = "t2.micro"

  tags = {
    Name = var.instance_name
  }
}




resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"

  ingress {
    from_port        = var.port-1
    to_port          = var.port-1
    protocol         = "tcp"
    cidr_blocks      = ["11.22.33.44/32"]
  }

  ingress {
    from_port        = var.port-2
    to_port          = var.port-2
    protocol         = "tcp"
    cidr_blocks      = ["11.22.33.44/32"]
  }

  ingress {
    from_port        = var.port-3
    to_port          = var.port-3
    protocol         = "tcp"
    cidr_blocks      = ["11.22.33.44/32"]
  }

  ingress {
    from_port        = var.port-4
    to_port          = var.port-4
    protocol         = "tcp"
    cidr_blocks      = ["11.22.33.44/32"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_tls"
  }
}

```

**Data_Types - String**

vi variable.tf

```
variable sg_name {
    description = "Enter a name for Security Group"
    type = string
}
```


vi sg.tf

```
resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"

  ingress {
    from_port        = var.port-1
    to_port          = var.port-1
    protocol         = "tcp"
    cidr_blocks      = ["11.22.33.44/32"]
  }

  ingress {
    from_port        = var.port-2
    to_port          = var.port-2
    protocol         = "tcp"
    cidr_blocks      = ["11.22.33.44/32"]
  }

  ingress {
    from_port        = var.port-3
    to_port          = var.port-3
    protocol         = "tcp"
    cidr_blocks      = ["11.22.33.44/32"]
  }

  ingress {
    from_port        = var.port-4
    to_port          = var.port-4
    protocol         = "tcp"
    cidr_blocks      = ["11.22.33.44/32"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = var.sg_name
  }
}
```


**Data_Type - Lists**


vi variable.tf
variable port_number {
     description = "Enter four  port numbers for inbound rules"
     type = list(number)
}

vi sg.tf

```
resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"

  ingress {
    from_port        = var.port_number[0]
    to_port          = var.port_number[0]
    protocol         = "tcp"
    cidr_blocks      = ["11.22.33.44/32"]
  }

  ingress {
    from_port        = var.port_number[1]
    to_port          = var.port_number[1]
    protocol         = "tcp"
    cidr_blocks      = ["11.22.33.44/32"]
  }

  ingress {
    from_port        = var.port_number[2]
    to_port          = var.port_number[2]
    protocol         = "tcp"
    cidr_blocks      = ["11.22.33.44/32"]
  }

  ingress {
    from_port        = var.port_number[3]
    to_port          = var.port_number[3]
    protocol         = "tcp"
    cidr_blocks      = ["11.22.33.44/32"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = My-SG   
  }
}

```

**Date-2.12.2024**

root@ip-172-31-19-195:/home/labsuser/datatypes# terraform plan
var.port_number
  Enter four  port numbers for inbound rules

  Enter a value:  [ 8080,9090,80,443]

╷
│ Error: Invalid reference   # this error is for the above code, bellow is its MetaAI solution
│ 
│   on sg.tf line 41, in resource "aws_security_group" "allow_tls":
│   41:     Name = My-SG
│ 
│ A reference to a resource type must be followed by at least one attribute access, specifying the resource name.


MetaAI:- 

The error message indicates that there's an issue with the Name attribute in the aws_security_group resource.

The problem is that the Name attribute is not a valid attribute for the aws_security_group resource. Instead, you should use the name attribute (note the lowercase "n").

Here's the corrected code:


resource "aws_security_group" "allow_tls" {
   ... other attributes ...
  name = "My-SG"
   ... other attributes ...
}


By changing **Name** to **name**, you should be able to resolve the error.


again the following error


 Error: Invalid reference
│ 
│   on sg.tf line 41, in resource "aws_security_group" "allow_tls":
│   41:     name = My-SG
│ 
│ A reference to a resource type must be followed by at least one attribute access, specifying the resource name.
╵

Soolution:-

It looks like the issue is not with the name attribute itself, but rather with the value assigned to it.

The error message suggests that Terraform is interpreting My-SG as a reference to a resource, rather than a string value.

To fix this, you can simply wrap the value in double quotes, like this:

```
resource "aws_security_group" "allow_tls" {
   ... other attributes ...
    name = "My-SG"
   ... other attributes ...
}

```


By wrapping the value in double quotes, you're telling Terraform to treat it as a string literal, rather than a reference to a resource.

Proper code for variable.tf and security group.tf


root@ip-172-31-19-195:/home/labsuser/datatypes# cat variable.tf sg.tf

vi variable.tf
 
```
variable port_number {
     description = "Enter four  port numbers for inbound rules"
     type = list(number)
}

```

vi sg.tf

```
resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"

  ingress {
    from_port        = var.port_number[0]
    to_port          = var.port_number[0]
    protocol         = "tcp"
    cidr_blocks      = ["11.22.33.44/32"]
  }

  ingress {
    from_port        = var.port_number[1]
    to_port          = var.port_number[1]
    protocol         = "tcp"
    cidr_blocks      = ["11.22.33.44/32"]
  }

  ingress {
    from_port        = var.port_number[2]
    to_port          = var.port_number[2]
    protocol         = "tcp"
    cidr_blocks      = ["11.22.33.44/32"]
  }

  ingress {
    from_port        = var.port_number[3]
    to_port          = var.port_number[3]
    protocol         = "tcp"
    cidr_blocks      = ["11.22.33.44/32"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "My-SG"
  }
}

```


**Data_Type- Map**



Docs: {Imp read all}

1. Documentation link: https://developer.hashicorp.com/terraform/language/expressions/types

2.  https://spacelift.io/blog/terraform-map-variable

3. https://www.env0.com/blog/terraform-map-variable-a-complete-guide-with-practical-examples#:~:text=Terraform%20map%20variable%20helps%20with,regions%20without%20repeating%20your%20code. 

**Date:-3.12.2024**

```
Question: MetaAI
Following is my ec2 terraform code:
 
provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "web" { 
  ami = "ami-0cd59ecaf368e5ccf"
  instance_type = var.instance_type_map["web"]
  
 tags = { 
   Name = "HelloWorld"
   Team = "DevOps"
  } 
}
and the following is my variable.tf code:

variable instance_type_map {
  type = map(string)
  default = {
    "web" = "t2.nano"
    "db" = "t2.micro"
    "devops" = "t3.micro"   

How to use the values in the variable to create the number of instances as is the number of keys

Solution:
To create multiple EC2 instances based on the number of keys in the instance_type_map variable, you can use Terraform's for_each argument.

Here's an updated version of your (link unavailable) code:


provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "web" {
  for_each = var.instance_type_map

  ami           = "ami-0cd59ecaf368e5ccf"
  instance_type = each.value
  tags = {
    Name = "HelloWorld-${each.key}"
    Team = "DevOps"
  }
}


In this code:

- We've added the for_each argument to the aws_instance resource and set it to var.instance_type_map.
- We've replaced the instance_type attribute with each.value, which refers to the value of each key-value pair in the instance_type_map variable.
- We've updated the Name tag to include the key from the instance_type_map variable using each.key.

With this code, Terraform will create multiple EC2 instances, one for each key-value pair in the instance_type_map variable.

Question:

will it create instances depending on the number of key-value pair ?

Solution:

With the for_each argument, Terraform will create a separate instance for each key-value pair in the instance_type_map variable.

For example, if your instance_type_map variable looks like this:


variable "instance_type_map" {
  type = map(string)
  default = {
    "web" = "t2.nano"
    "db"  = "t2.micro"
    "devops" = "t3.micro"
  }
}


Terraform will create three separate EC2 instances:

1. One instance with instance type t2.nano and tags Name = "HelloWorld-web" and Team = "DevOps"
2. One instance with instance type t2.micro and tags Name = "HelloWorld-db" and Team = "DevOps"
3. One instance with instance type t3.micro and tags Name = "HelloWorld-devops" and Team = "DevOps"

So, yes, the number of instances created will depend on the number of key-value pairs in the instance_type_map variable.

```



