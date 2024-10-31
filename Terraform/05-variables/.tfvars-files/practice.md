### Practice :-1

## cat main.tf 

 ```
 provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "webs" {
  count             = length(var.zones)
  ami = var.image_id
  instance_type = "t2.micro"
  availability_zone = var.zones[count.index]

  tags = {
    Name = "${join("-", tolist([var.myname]))}-${count.index+1}"
    Team = "DevOps"
  }

}
```


 ## cat variable.tf 
 
 ```
# Declare variables
variable "image_id" {
  type = string
}

variable "zones" { 
  type = list(string)
  default = ["us-east-1a", "us-east-1b"]
}

variable "myname" {
  type = string
  default = "mydefault-instances"
}
```


## cat testing.tfvars

```
myname = "Test-EC2"                        # Variable-1        EC2 Instance Names in the AWS console  

image_id = "ami-005fc0f236362e99f"         # Variable-2        Image AMI ID 

zones =        [                           # Variable-3        Zones in which the Instances will be created
  "us-east-1a",
  "us-east-1b",
  "us-east-1c",
  "us-east-1d",
  "us-east-1e",
  "us-east-1f"
]
```


```
t apply -var-file="testing.tfvars" -auto-approve
```

When we run the above command, terraform creates six EC2 instances in the above six zones.


root@Master:/home/labsuser# # Output:-
root@Master:/home/labsuser# terraform state list
aws_instance.webs[0]
aws_instance.webs[1]
aws_instance.webs[2]
aws_instance.webs[3]
aws_instance.webs[4]
aws_instance.webs[5]
root@Master:/home/labsuser#


AWS console screenshot : ![Screenshot (228)](https://github.com/user-attachments/assets/9160e2a1-777d-44db-9caa-32386e61a1ec)




### Practice :-2

## cat uat.tfvars

```
myname = "UAT-EC2"
```

## cat prod.tfvars

```
myname = "PROD-EC2"
```



