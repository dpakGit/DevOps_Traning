#### Count , Count_Index , 

**Case-1:**
How to create multiple EC2 instances or any resource using  

```
resource "aws_instance" "server" {
  count = 4 # create four similar EC2 instances

  ami = "ami-0cd59ecaf368e5ccf"
  instance_type = "t2.micro"

  tags = {
    Name = "Server ${count.index}"
  }
}

```


Source- MeatAI

Q. How to have different names for the instances created by the following terraform code -resource "aws_instance" "web" { 
  ami = "ami-0cd59ecaf368e5ccf"
  instance_type = t2.micro
  count = 3
 tags = { 
   Name = "Instance"
   Team = "DevOps"
  } 
}

Sol:-1    **Format Function**

To have different names for the instances created by the Terraform code, you can use the count argument in combination with the format function to create unique names for each instance.

Here's an example of how you can modify the code to achieve this:


resource "aws_instance" "web" {
  ami           = "ami-0cd59ecaf368e5ccf"
  instance_type = "t2.micro"
  count         = 3

  tags = {
    Name = format("Instance-%02d", count.index + 1)
    Team = "DevOps"
  }
}


In this modified code:

- We use the format function to create a string that includes the instance number.
- The %02d format specifier is used to pad the instance number with leading zeros if necessary, so that the names are consistently formatted (e.g., "Instance-01", "Instance-02", etc.).
- The count.index variable is used to get the index of the current instance being created. We add 1 to this index to make the instance numbers start from 1 instead of 0.

With this modified code, Terraform will create three instances with unique names: "Instance-01", "Instance-02", and "Instance-03".



Q. To have specific names like dev,test and devops.

Sol:-2 **Element Function**

To have specific names like "dev", "test", and "devops" for the instances, you can use the count argument in combination with a list of names.

Here's an example of how you can modify the code to achieve this:


resource "aws_instance" "web" {
  ami           = "ami-0cd59ecaf368e5ccf"
  instance_type = "t2.micro"
  count         = 3

  tags = {
    Name = element(["dev", "test", "devops"], count.index)
    Team = "DevOps"
  }
}


In this modified code:

- We define a list of names ["dev", "test", "devops"].
- We use the element function to select the corresponding name from the list based on the count.index value.
- The count.index value starts from 0, so the first instance will get the name "dev", the second instance will get the name "test", and the third instance will get the name "devops".

With this modified code, Terraform will create three instances with the specific names "dev", "test", and "devops".

