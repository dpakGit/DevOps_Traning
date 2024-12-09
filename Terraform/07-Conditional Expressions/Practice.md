**MetaAI**

Q. I have two separate EC2 instance blocks, and I want to create only the instance that corresponds to the user's input. How can I achieve this conditional instance creation?



Sol: You're looking to create a conditional EC2 instance creation based on user input. You can achieve this using Terraform's count attribute and a conditional expression.

#### Practice - 1

provider "aws" {
  region = "us-east-1"
}

variable "instance_type" {
  type    = string
  default = "db"
}

resource "aws_instance" "web" {
  count         = var.instance_type == "web" ? 1 : 0
  ami           = "ami-0cd59ecaf368e5ccf"
  instance_type = "t2.nano"

  tags = {
    Name = "Web_ec2"
  }
}

resource "aws_instance" "db" {
  count         = var.instance_type == "db" ? 3 : 0
  ami           = "ami-0cd59ecaf368e5ccf"
  instance_type = "t2.micro"
  tags = {
    Name = "Database_ec2"
  }

}


In this example:

- We define a instance_type variable with a default value of "web".
- We create two separate aws_instance resources, one for "web" and one for "db".
- We use the count attribute to conditionally create the instance based on the value of var.instance_type. If the value matches the instance type, the count is set to 1, otherwise it's set to 0.


Yes, that's correct. When you run terraform apply, Terraform will evaluate the count attribute in each resource block. If the default value in the variable block matches the condition in the count attribute, Terraform will create that many instances.

In the example I provided earlier, if the default value of the instance_type variable is "web", Terraform will create one instance of the aws_instance resource with the name "web".


#### Practice - 2

provider "aws" {
  region = "us-east-1"
}

variable "instance_type" {
  type = string
}

resource "aws_instance" "web" {
  count         = var.instance_type == "web" ? 1 : 0
  ami           = "ami-0cd59ecaf368e5ccf"
  instance_type = "t2.nano"

  tags = {
    Name = "Web_ec2-${count.index + 1}"
  }
}

resource "aws_instance" "db" {
  count         = var.instance_type == "db" ? 3 : 0
  ami           = "ami-0cd59ecaf368e5ccf"
  instance_type = "t2.micro"
  tags = {
    tags = {
      Name = "Database_ec2-${count.index + 1}"
  }

}


##### Explanation of the above code .

Since the variable block doesn't have a default value, Terraform will prompt the user to enter a value for instance_type when running terraform apply.

Based on the user's input, Terraform will then evaluate the count attribute in each resource block and create only the corresponding instance.

So, if the user enters "web", only the "web" instance will be created. If the user enters "db", only the "db" instance will be created (and it will create 3 instances since the count is set to 3).


#### How it works

1. When you run terraform apply, Terraform will prompt you to enter a value for the instance_type variable.
2. Based on the value you enter, Terraform will evaluate the count attribute in each resource block.
3. If the instance_type variable matches the condition in the count attribute, Terraform will create the specified number of EC2 instances.
4. If the instance_type variable does not match the condition, the count attribute will be set to 0, and no instances will be created.
