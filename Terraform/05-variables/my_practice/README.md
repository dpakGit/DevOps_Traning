
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
CLI Output:

ubuntu@ip-172-31-83-175:~/var$ t state list

aws_instance.web[0]

aws_instance.web[1] 

Screenshot of AWS console:


![Screenshot (201)](https://github.com/user-attachments/assets/d495bc91-1edf-4747-b762-1b779e2ca02c)
 

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
CLI Output: 

root@ip-172-31-83-175:/home/ubuntu/var# terraform state list

aws_instance.web[0]

aws_instance.web[1]

Screenshot of AWS console:


![Screenshot (202)](https://github.com/user-attachments/assets/716e3128-4f99-493d-9b77-8496556d5e3a)



Conclusion: **${count.index}** # Adding this lines gives two different names to the instances in the console.
Note: This will automatically asssign numbers to the names starting from 0



 #### 2.1     Or use the for_each argument.

**Source_MetaAI**

##### To create an instance in each of the two zones, you can use the for_each argument with toset():

 ```
provider "aws" {
  region = "us-east-1"
}

variable "zones" {
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b"]
}

resource "aws_instance" "web" {
  for_each = toset(var.zones)

  ami           = "ami-005fc0f236362e99f"
  instance_type = "t2.micro"
  availability_zone = each.value

  tags = {
    Name = "Web-${each.value}"
  }
}

```

Here's what's happening:

1. toset(var.zones) converts the list of zones to a set, which allows Terraform to iterate over each zone.

2. for_each = toset(var.zones) creates an instance for each zone in the set.

3. availability_zone = each.value sets the availability zone for each instance.

4. tags includes the zone name for each instance.

When you run terraform apply, this code will create two instances:

1. One in us-east-1a with name Web-us-east-1a.

2. One in us-east-1b with name Web-us-east-1b.


##### Alternatively, you can use zipmap() to create a map with zone names as keys and values:

```
resource "aws_instance" "web" {
  for_each = zipmap(var.zones, var.zones)

  ami           = "ami-005fc0f236362e99f"
  instance_type = "t2.micro"
  availability_zone = each.value

  tags = {
    Name = "Web-${each.key}"
  }
}
```

Both approaches achieve the same result.

Would you like:

1. More Terraform examples.
2. Guidance on using for_each.
3. Help with dynamic resource creation.
4. Other (please specify).

................................................

   
CLI Output:   for the above code with "**for_each** **argument** **with** **toset()**" 

root@ip-172-31-92-164:/home/ubuntu/variable# t state list

aws_instance.web["us-east-1a"]

aws_instance.web["us-east-1b"]



Screenshot of AWS console:


![Screenshot (204)](https://github.com/user-attachments/assets/0b03189d-9013-456f-9470-dec5a1ca3803)


Conclusion:


   



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
}

```

Incorrect syntax :  Name = "var.names ${count.index}" output of the names in the console will be "var.names 1" and "var.names 2".

CLI Output: 

root@ip-172-31-83-175:/home/ubuntu/var# terraform state list

aws_instance.web[0]

aws_instance.web[1]

Screenshot of AWS console:


![Screenshot (203)](https://github.com/user-attachments/assets/7163219e-7a2c-4093-a5d9-3c2b7479e04c)


Conclusion: Two instances wiyh unique names "sandy" and "boxy" created in two different zones


