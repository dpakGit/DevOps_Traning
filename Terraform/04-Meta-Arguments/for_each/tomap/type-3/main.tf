provider "aws" {
  region = "us-east-1"
}

variable "subnet_ids" {
  type        = list(string)
  default     = ["subnet-04323e4402471703c", "subnet-0df40585796432514"]
}

resource "aws_instance" "by_map" {
  for_each = tomap({
    "inst_a" = var.subnet_ids[0]
    "inst_b" = var.subnet_ids[1]
  })

  ami           = "ami-0cd59ecaf368e5ccf"
  instance_type = "t2.micro"
  subnet_id     = each.value

  tags = {
    Name = each.key
  }
}
