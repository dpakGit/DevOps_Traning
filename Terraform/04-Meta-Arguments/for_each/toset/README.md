 This file contains all the file in the **toset** directory.

1. 00-main.tf
```
provider "aws" {
  region = "us-east-1"
}

variable "user_names" {
  description = "IAM usernames"
  type        = set(string)
  default     = ["Todd-2", "James-2", "Alice-2", "Dottie-2"]                             
}

resource "aws_iam_user" "example" {
  for_each = var.user_names
  name  = each.value
}
```

2. main.tf
 # Source : https://developer.hashicorp.com/terraform/language/meta-arguments/for_each#when-to-use-for_each-instead-of-count

```
provider "aws" {
  region = "us-east-1"
}

resource "aws_iam_user" "the-accounts" {
  for_each = toset(["Todd", "James", "Alice", "Dottie"])
  name     = each.key
}
```

3. # Creating an ec2 instance using for_each

```
provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "sandbox" {
  ami = "ami-0cd59ecaf368e5ccf"
  instance_type = "t2.micro"
 
  for_each = toset(["sandbox_one", "sandbox_two", "sandbox_three"])
 
tags = {
    Name = each.value   # for a set, each.value and each.key is the same, we can also write each.key in place of each.value
  }
}

```

# 4. # Creating an ec2 instance using for_each

```
provider "aws" {
  region = "us-east-1"
}


resource "aws_instance" "sandbox" {
  ami = "ami-0cd59ecaf368e5ccf" 
  instance_type = "t2.micro"
  for_each = toset(["sandbox_one", "sandbox_two", "sandbox_three"])
  
tags = { 
   Name = each.key          # for a set, each.value and each.key is the same
}
}

```

