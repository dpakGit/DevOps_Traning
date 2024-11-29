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
