# Compare IAM-main.tf and main.tf examples, both gives the same result


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

