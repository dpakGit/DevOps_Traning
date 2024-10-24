# Source : https://developer.hashicorp.com/terraform/language/meta-arguments/for_each#when-to-use-for_each-instead-of-count

provider "aws" {
  region = "us-east-1"
}

resource "aws_iam_user" "the-accounts" {
  for_each = toset(["Todd", "James", "Alice", "Dottie"])
  name     = each.key
}
