# 1. Source: https://jhooq.com/terraform-for-and-for-each-loop/#2-_loops-with-for_each_

# Compare type-1 and type-2 examples

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

