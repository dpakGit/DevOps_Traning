## Resource Blocks
- https://developer.hashicorp.com/terraform/language/resources/syntax   - Date 19.10.2024


#### Date 14.11.2024

```
provider "aws" {
  region = "us-east-1"
}


variable "instance_name" {
  description = "Value of the Name tag for the EC2 instance"
  type        = string
  default     = "EC2"
}


resource "aws_instance" "web" {
  count         = 2
  ami           = "ami-0cd59ecaf368e5ccf"
  instance_type = "t2.micro"

  tags = {
    Name = "HelloWorld"
    Name = var.instance_name
    Team = "DevOps"
  }
}
```


Output: Console name of resource is EC2.

Why terraform is choosing  var.instance_name instead of  "HelloWorld":  a static tag value ?


Source: MetaAI

In Terraform, when you define multiple values for the same tag key (Name), the last assignment wins.

In your original code:

tags = {
  Name = "HelloWorld"
  Name = var.instance_name
  Team = "DevOps"
}

Terraform will choose var.instance_name over "HelloWorld" because it's the last assignment.

This behavior is known as "last one wins" or "override" semantics.

Why Terraform chooses the variable over the static value:

1. Terraform's configuration language is designed to prioritize dynamic values over static ones.
2. Variables (var.instance_name) are meant to be reusable and flexible, whereas static values ("HelloWorld") are, well, static.
3. By choosing the variable, Terraform allows you to easily change the value in one place (the variable declaration) rather than updating multiple static values throughout your configuration.

To prioritize the static value:

If you want to use the static value "HelloWorld" instead of var.instance_name, simply remove or comment out the variable assignment:

tags = {
  Name = "HelloWorld"
  # Name = var.instance_name
  Team = "DevOps"
}

Now, "HelloWorld" will be used as the Name tag value.

Best Practice:

To avoid conflicts, use distinct tag keys or merge values using string interpolation:

tags = {
  Name        = "${var.instance_name}-HelloWorld"
  Team        = "DevOps"
}


**Date:-16.12.2024**



https://developer.hashicorp.com/terraform/language/expressions/type-constraints#collection-types

https://developer.hashicorp.com/terraform/language/expressions/type-constraints


**Date : 8.1.2024**

#### Types of Named Values

Read the content of this link -  https://developer.hashicorp.com/terraform/language/expressions/references#types-of-named-values

The main kinds of named values available in Terraform are:

Resources
Input variables
Local values
Child module outputs
Data sources
Filesystem and workspace info
Block-local values


#### 5 Ways to Manage Terraform at Scale – Best Practices

https://spacelift.io/blog/5-ways-to-manage-terraform-at-scale

#### How to Use Terraform Join and Split Functions with Strings

https://spacelift.io/blog/terraform-join

## Amazon EC2 AMI Locator :

https://cloud-images.ubuntu.com/locator/ec2/

![Screenshot (5)](https://github.com/user-attachments/assets/7326c0d4-78ff-4bd7-b1b7-17fff15186f1)

