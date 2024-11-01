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


##  cat testing.tfvars

```

myname = "Test-EC2"                     # Variable-1      EC2 Instance Names in the AWS console  


image_id = "ami-005fc0f236362e99f"      # Variable-2      Image AMI ID 


zones =        [                        # Variable-3   Zones in which the Instances will be created
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


#### How it works .
Let's break down how this Terraform configuration works:

(link unavailable)

1. provider "aws" { region = "us-east-1" }:
    - Specifies the AWS provider and sets the region to us-east-1.
2. resource "aws_instance" "webs" { ... }:
    - Defines an AWS EC2 instance resource named webs.
3. count = length(var.zones):
    - Creates multiple instances based on the length of the var.zones list.
4. ami = var.image_id:
    - Sets the Amazon Machine Image (AMI) ID for the instances.
5. instance_type = "t2.micro":
    - Specifies the instance type.
6. availability_zone = var.zones[count.index]:
    - Sets the Availability Zone (AZ) for each instance based on the var.zones list index.
7. tags = { ... }:
    - Adds tags to the instances.

(link unavailable)

1. variable "image_id" { type = string }:
    - Declares a variable image_id of type string without a default value.
2. variable "zones" { type = list(string) default = ["us-east-1a", "us-east-1b"] }:
    - Declares a variable zones of type list(string) with a default value of ["us-east-1a", "us-east-1b"].
3. variable "myname" { type = string default = "mydefault-instances" }:
    - Declares a variable myname of type string with a default value of "mydefault-instances".

How it works

1. When you run terraform apply, Terraform initializes the configuration.
2. It reads the (link unavailable) file and sets the default values for zones and myname.
3. You must provide a value for image_id using the -var flag (e.g., -var "image_id=ami-abc123").
4. Terraform creates multiple EC2 instances based on the length of the zones list (2 instances in this case).
5. For each instance:
    - It sets the AMI ID to the provided image_id value.
    - It sets the instance type to t2.micro.
    - It sets the Availability Zone to the corresponding value in the zones list (us-east-1a and us-east-1b).
    - It adds tags with the Name set to <myname>-<index+1> (e.g., mydefault-instances-1 and mydefault-instances-2) and Team set to DevOps.

Example output:

2 EC2 instances created:

| Instance ID | Availability Zone | Name                 | Team   |
|-------------|-------------------|----------------------|--------|
| i-012345678 | us-east-1a        | mydefault-instances-1 | DevOps |
| i-098765432 | us-east-1b        | mydefault-instances-2 | DevOps |

Do you have any specific questions about this configuration or Terraform in general?


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



