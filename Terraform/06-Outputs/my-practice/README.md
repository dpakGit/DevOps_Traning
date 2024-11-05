#### practice:-1 - Display only the public IPs of the Instances on the CLI.


main.tf

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

#/ Declare Output variable to display public ips

output "public_ips" {
  value = aws_instance.web.*.public_ip
}

```

```
terraform apply -auto-approve

```
#### Output on the CLI


Apply complete! Resources: 2 added, 0 changed, 0 destroyed.

Outputs:

public_ips = [
  "54.160.220.190",
  "34.201.171.79",
]

AWS Console screenshot: ![Screenshot (240)](https://github.com/user-attachments/assets/26276d85-da6d-410a-94f6-85b03eaeb35e)


root@ip-172-31-19-68:/home/ubuntu/output# terraform state list
aws_instance.web[0]
aws_instance.web[1]


#### practice:-2 - Display only the private IPs of the Instances on the CLI.

main.tf

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

#/ Declare Output variable to display private ips

output "private_ips" { 
  value = aws_instance.web.*.private_ip
}

```


#### Output on the CLI

Apply complete! Resources: 2 added, 0 changed, 0 destroyed.

Outputs:

private_ips = [
  "172.31.19.249",
  "172.31.42.206",
]


#### practice:-3 - Display both public and private IPs of the Instances on the CLI.


main.tf

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


output "public_ips" {
  value = aws_instance.web.*.public_ip
}


output "private_ips" { 
  value = aws_instance.web.*.private_ip
}

```





#### Output on the CLI

Apply complete! Resources: 0 added, 0 changed, 0 destroyed.

Outputs:

private_ips = [
  "172.31.19.249",
  "172.31.42.206",
]
public_ips = [
  "54.163.62.150",
  "54.210.64.56",
]


#### practice:-6 - To get the desire output of a public or private ip


#### Display the public IP of the first Instances and private IP of the second on the CLI.


main.tf

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

# Disply public ip of first instance

output "public_ips_of_first_instance" { 
  value = aws_instance.web.0.public_ip
}


# Display the private ip of the second instance

output "private_ips_of_second_instance" {
  value = aws_instance.web.1.private_ip
}


```



#### Output on the CLI


Outputs:

private_ips_of_second_instance = "172.31.46.45"

public_ips_of_first_instance = "54.234.210.90"


Date 4.11.2024

#### practice:-7 -  Separate Outputs (variable and main.tf) files


 **main.tf**

``` 
provider "aws" {
  region = "us-east-1"
}



resource "aws_instance" "web" {
  count = 2
  ami           = "ami-005fc0f236362e99f"
  instance_type = "t2.micro"
  availability_zone = var.zones[count.index]

  tags = {
    Name = "WebServer-AV"
    Team = "DevOps"
  }

}

```

 **variable.tf**  

 ```

variable "zones" {
  type = list(string)
  default = ["us-east-1c", "us-east-1b"]
}

dpakmishra1983g@ip-172-31-3-164:~$ cat outputs.tf
output "public_ips" {
  value = aws_instance.web.*.public_ip
}

```


**Output.tf** 

```

output "public_ips" {
  value = aws_instance.web.*.public_ip
}



output "private_ips" {
  value = aws_instance.web.*.private_ip
}



output "private_ips_of_first_instance" {
  value = aws_instance.web.0.private_ip
}


```


#### practice-8 :- - Create infrastructure :: 


https://developer.hashicorp.com/terraform/tutorials/configuration-language/outputs#create-infrastructure


#### Clone the example repository for this tutorial, which contains Terraform configuration for a web application including a VPC, load balancer, EC2 instances, and a database.


cmd :- git clone https://github.com/hashicorp/learn-terraform-outputs.git

... Rest read from the above link.


#### practice-9 


#### Source: MetaAI

Following is my main.tf file

```
provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "web" {
  ami = "ami-0cd59ecaf368e5ccf"
  instance_type = "t2.micro"
  count = 4

 tags = {
   Name = "HelloWorld"
   Team = "DevOps"
  }
}

```


#### Solution by MetaAI

How to get the public ip of the the instances created by the above main.tf file on the CLI


To get the public IP addresses of the instances created by your (link unavailable) file, you can use the Terraform output command or the AWS CLI.

#### Method 1: Terraform Output

Add the following code to your (link unavailable) file:


terraform
output "public_ips" {
  value = aws_instance.web.*.public_ip
}


Then, run:


bash
terraform apply


The public IP addresses will be displayed in the output.

#### Method 2: AWS CLI

Run the following command:


bash
aws ec2 describe-instances --filters "Name=tag:Name,Values=HelloWorld" --query 'Reservations[*].Instances[*].PublicIpAddress' --output text


This command filters instances by the Name tag (HelloWorld) and retrieves their public IP addresses.

#### Method 3: Terraform Console

Run the following command:


bash
terraform console


Then, execute:


terraform
aws_instance.web.*.public_ip


This will display the public IP addresses in the Terraform console.

Choose the method that suits your needs!


 .......................



 root@ip-172-31-32-119:/home/ubuntu# terraform console # Ran the following command


####  > aws_instance.web.*.public_ip # inside it i ran the following command, which gave me the desired output

[
  "34.207.74.98",
  "18.232.75.68",
  "54.205.104.209",
  "34.207.139.204",
]
> exit # To exit from the bash shell



