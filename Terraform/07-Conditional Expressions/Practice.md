**MetaAI**      Date: 9.12.2024

Q. I have two separate EC2 instance blocks, and I want to create only the instance that corresponds to the user's input. How can I achieve this conditional instance creation?



Sol: You're looking to create a conditional EC2 instance creation based on user input. You can achieve this using Terraform's count attribute and a conditional expression.

#### Practice - 1


```
provider "aws" {
  region = "us-east-1"
}

variable "instance_name" {    # Make it "instance_name" in all the following places
  type    = string
  default = "db"
}

resource "aws_instance" "web" {
  count         = var.instance_name == "web" ? 1 : 0
  ami           = "ami-0cd59ecaf368e5ccf"
  instance_type = "t2.nano"

  tags = {
    Name = "Web_ec2"
  }
}

resource "aws_instance" "db" {
  count         = var.instance_name == "db" ? 3 : 0
  ami           = "ami-0cd59ecaf368e5ccf"
  instance_type = "t2.micro"
  tags = {
    Name = "Database_ec2"
  }

}
```


In this example:

- We define a instance_name variable with a default value of "web".
- We create two separate aws_instance resources, one for "web" and one for "db".
- We use the count attribute to conditionally create the instance based on the value of var.instance_name. If the value matches the instance type, the count is set to 1, otherwise it's set to 0.


Yes, that's correct. When you run terraform apply, Terraform will evaluate the count attribute in each resource block. If the default value in the variable block matches the condition in the count attribute, Terraform will create that many instances.

In the example I provided earlier, if the default value of the instance_type variable is "web", Terraform will create one instance of the aws_instance resource with the name "web".


#### Practice - 2

```
provider "aws" {
  region = "us-east-1"
}

variable "instance_name" {
  type = string
}

resource "aws_instance" "web" {
  count         = var.instance_name == "web" ? 1 : 0
  ami           = "ami-0cd59ecaf368e5ccf"
  instance_type = "t2.nano"

  tags = {
    Name = "Web_ec2-${count.index + 1}"
  }
}

resource "aws_instance" "db" {
  count         = var.instance_name == "db" ? 3 : 0
  ami           = "ami-0cd59ecaf368e5ccf"
  instance_type = "t2.micro"
  tags = {
    tags = {
      Name = "Database_ec2-${count.index + 1}"
  }

}
```


##### Explanation of the above code .

Since the variable block doesn't have a default value, Terraform will prompt the user to enter a value for instance_name when running terraform apply.

Based on the user's input, Terraform will then evaluate the count attribute in each resource block and create only the corresponding instance.

So, if the user enters "web", only the "web" instance will be created. If the user enters "db", only the "db" instance will be created (and it will create 3 instances since the count is set to 3).


#### How it works

1. When you run terraform apply, Terraform will prompt you to enter a value for the instance_name variable.
2. Based on the value you enter, Terraform will evaluate the count attribute in each resource block.
3. If the instance_name variable matches the condition in the count attribute, Terraform will create the specified number of EC2 instances.
4. If the instance_name variable does not match the condition, the count attribute will be set to 0, and no instances will be created.




## Conditional Expressions:

https://developer.hashicorp.com/terraform/language/expressions/conditionals

**Syntax**
The syntax of a conditional expression is as follows:

```hcl
condition ? true_val : false_val
```


Q. 
**Explain the syntax : - condition ? true_val : false_val**

This is a conditional expression, also known as a ternary operator. It's a concise way to evaluate a condition and return one of two values.

Here's a breakdown of the syntax:

- condition: This is the condition being evaluated. It can be a boolean expression, a comparison, or any other type of condition.
- ?: This is the ternary operator. It separates the condition from the two possible values.
- true_val: This is the value returned if the condition is true.
- false_val: This is the value returned if the condition is false.


``Here's an example:``

``x > 5 ? "greater than 5" : "less than or equal to 5"``

``In this example, if x is greater than 5, the expression returns the string "greater than 5". Otherwise, it returns the string "less than or equal to 5"``.

The ternary operator is often used to simplify if-else statements and make code more concise.




### DevopsPro Code

```
# Variable Block

variable "is_dev_env" {
  type = bool
}

# Resource Block

resource "aws_instance" "dev" {
  count = var.is_dev_env == true ? 1 : 0
  ami           = "ami-0f34c5ae932e6f0e4"
  instance_type = "t2.nano"
  tags = {
    Name = "dev-ec2"
  }
}

resource "aws_instance" "prod" {
  count = var.is_dev_env == false ? 2 : 0
  ami           = "ami-0f34c5ae932e6f0e4"
  instance_type = "t2.large"
  tags = {
    Name = "prod-ec2"
  } 
}
```

**MetaAI**

Explanation:

The creation of these instances is conditional, based on the value of the var.is_dev_env variable.
- dev instance:
    - Created only if var.is_dev_env is true.
    - Has a count of 1, meaning only one instance will be created.
    - Uses the t2.nano instance type.
    - Has a tag with the name dev-ec2.
- prod instance:
    - Created only if var.is_dev_env is false.
    - Has a count of 2, meaning two instances will be created.
    - Uses the t2.large instance type.
    - Has a tag with the name prod-ec2.

Q. Explain the following part of the code -             **V.V.IMP**

Syntax: -  **count = var.is_dev_env == true ? 1 : 0**    

Sol: 

**This line of code is using a conditional expression to determine the value of the count attribute**.

Here's a breakdown:

- var.is_dev_env == true is a condition that checks if the value of the is_dev_env variable is true.
- The ? symbol is a ternary operator that evaluates the condition and returns one of two values.
- If the condition is true, the expression returns 1.
- If the condition is false, the expression returns 0.

So, in essence, this line of code is saying:

"If var.is_dev_env is true, create 1 instance. Otherwise, create 0 instances." 

``Meaning, if var.is_dev_env is true, the count attribute is set to 1, resulting in the creation of one instance. Conversely, if var.is_dev_env is false, the count attribute is set to 0, meaning no instance will be created.``

This is a concise way to express a conditional statement and assign a value to the count attribute based on the condition.

If the value is 2 or 3 instead of 1, Terraform will create that many instances accordingly.

For example:

- count = var.is_dev_env == true ? 2 : 0 will create 2 instances if var.is_dev_env is true.
- count = var.is_dev_env == true ? 3 : 0 will create 3 instances if var.is_dev_env is true.

This allows you to dynamically control the number of instances created based on the value of the is_dev_env variable.



**Date:- 10.12.2024**

**Error:** creating EC2 Instance: operation error EC2: RunInstances, https response error StatusCode: 400, RequestID: 7444c4b1-d38a-4d2f-9a54-3b6045cb155e, api error InvalidAMIID.NotFound: The image id '[ami-0cd59ecaf368e5ccf]' does not exist
│ 
│   with aws_instance.dev[0],
│   on ec2.tf line 12, in resource "aws_instance" "dev":
│   12: resource "aws_instance" "dev" {
│ 
╵
╷
│ Error: creating EC2 Instance: operation error EC2: RunInstances, https response error StatusCode: 400, RequestID: f5275591-41a4-4036-bf25-a9114958f553, api error InvalidAMIID.NotFound: The image id '[ami-0cd59ecaf368e5ccf]' does not exist
│ 
│   with aws_instance.prod,
│   on ec2.tf line 22, in resource "aws_instance" "prod":
│   22: resource "aws_instance" "prod" {


**Date:-11.12.2024**

**Practice -1**

 terraform apply -auto-approve
var.is_dev_env
  Enter a value: true

root@ip-172-31-18-189:/home/ubuntu# cat **code_1.tf**

```
# Variable Block

variable "is_dev_env" {
  type = bool
}

# Resource Block

resource "aws_instance" "dev" {
  count = var.is_dev_env == true ? 1 : 0
  ami           = "ami-005fc0f236362e99f"
  instance_type = "t2.micro"
  tags = {
    Name = "dev-ec2"
  }
}

resource "aws_instance" "prod" {
  # count = var.is_dev_env == false ? 2 : 0
  ami           = "ami-005fc0f236362e99f"
  instance_type = "t3.medium"
  tags = {
    Name = "prod-ec2"
  } 
}
```

  root@ip-172-31-18-189:/home/ubuntu# terraform state list


Output:
  
aws_instance.dev[0]

aws_instance.prod


The above code created two instances

**2nd -case**

root@ip-172-31-18-189:/home/ubuntu# terraform apply -auto-approve
var.is_dev_env
  Enter a value: false

root@ip-172-31-18-189:/home/ubuntu# cat **code_2.tf**

```
# Variable Block

variable "is_dev_env" {
  type = bool
}

# Resource Block

resource "aws_instance" "dev" {
  #count = var.is_dev_env == true ? 1 : 0
  ami           = "ami-005fc0f236362e99f"
  instance_type = "t2.micro"
  tags = {
    Name = "dev-ec2"
  }
}

resource "aws_instance" "prod" {
   count = var.is_dev_env == false ? 2 : 0
  ami           = "ami-005fc0f236362e99f"
  instance_type = "t3.medium"
  tags = {
    Name = "prod-ec2"
  } 
}
```

Created 3 instances 1 dev and two prod:

root@ip-172-31-18-189:/home/ubuntu# terraform state list
aws_instance.dev

aws_instance.prod[0]

aws_instance.prod[1]



