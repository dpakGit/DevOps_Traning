
#### 1. 01-main.tf # The following file will create two Ec2 instances in two zones
   
```
provider "aws" {
  region = "us-east-1"
}

variable "zones" { 
  type = list(string)
  default = ["us-east-1a", "us-east-1b"]
}

resource "aws_instance" "web" {
  count = 2
  ami = "ami-005fc0f236362e99f"
  instance_type = "t2.micro"
  availability_zone = var.zones[count.index]

  tags = {
    Name = "Web-Var"
  }
}
```
Output:

ubuntu@ip-172-31-83-175:~/var$ t state list

aws_instance.web[0]

aws_instance.web[1] 

Screenshot of AWS console:  ![Screenshot (201)](https://github.com/user-attachments/assets/d495bc91-1edf-4747-b762-1b779e2ca02c)
 

Conclusion: But the names of the instances in the console is same i.e; "Web-Var"


#### 2. 02-main.tf # 
The following file will create two Ec2 instances in two zones with two different names of the two instances in the 
console.

```
provider "aws" {
  region = "us-east-1"
}
variable "zones" {
  type = list(string)
  default = ["us-east-1a", "us-east-1b"]
}

resource "aws_instance" "web" {
  count = 2
  ami = "ami-005fc0f236362e99f"
  instance_type = "t2.micro"
  availability_zone = var.zones[count.index]

  tags = {
    Name = "web ${count.index}" # Adding this lines gives two different names to the instances in the console.
}
}
```
Output: 
root@ip-172-31-83-175:/home/ubuntu/var# terraform state list
aws_instance.web[0]
aws_instance.web[1]

Screenshot of AWS console: ![Screenshot (202)](https://github.com/user-attachments/assets/716e3128-4f99-493d-9b77-8496556d5e3a)

Conclusion: **${count.index}** # Adding this lines gives two different names to the instances in the console.
Note: This will automatically asssign numbers to the names starting from 0


#### 3. 03-main.tf Suppose we want to give unique or specific names to the instances.
   Then how to define the variables

   ```
provider "aws" {
  region = "us-east-1"
}
variable "zones" {
  type = list(string)
  default = ["us-east-1a", "us-east-1b"]
}

variable "names" {
  type = list(string)
  default = ["sandy","boxy"]
}

resource "aws_instance" "web" {
  count = 2
  ami = "ami-005fc0f236362e99f"
  instance_type = "t2.micro"
  availability_zone = var.zones[count.index]

  tags = {
    Name = var.names[count.index] #   Incorrect syntax : Name = "var.names ${count.index}" 
}
}```

Incorrect syntax :  Name = "var.names ${count.index}" output of the names in the console will be "var.names 1" and "var.names 2".

CLI Output: 

root@ip-172-31-83-175:/home/ubuntu/var# terraform state list
aws_instance.web[0]
aws_instance.web[1]

Screenshot of AWS console: ![Screenshot (203)](https://github.com/user-attachments/assets/7163219e-7a2c-4093-a5d9-3c2b7479e04c)


Conclusion: Two instances wiyh unique names "sandy" and "boxy" created in two different zones


