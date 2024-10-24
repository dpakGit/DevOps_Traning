### 1. used the terraform documentation and spacelift doc (https://spacelift.io/blog/terraform-for-each). 

 Two instances will be created with inst_a and inst_b as resource identifier, which is used to reference it ...
... within the Terraform configuration and the names of the instance in the console will be Instance A and Instance B.  

```
provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "by_map" {

  for_each = tomap({
  
    "inst_a" = "Instance A" # key = value
    "inst_b" = "Instance B"
  })

  ami = "ami-0cd59ecaf368e5ccf"
  instance_type = "t2.micro"

  tags = {
    Name = each.value
    ID = each.key
  }
}
```

Output : root@Master:/home/labsuser/each.key_value# terraform state list # what was created out of the above configuration
aws_instance.by_map["inst_a"]
aws_instance.by_map["inst_b"]

AWS console Screenshot :  see in the screenshots folder


