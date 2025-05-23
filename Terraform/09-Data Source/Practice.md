1. Terraform's Data Sources enable the retrieval of external information, allowing you to leverage data defined outside of your Terraform code.

2. With Terraform's Data Sources, you can access and utilize information defined outside of your Terraform configuration, enhancing flexibility and reusability.

3. Terraform's Data Sources provide a powerful way to import and use data from external sources, such as AWS, Azure, or other systems, directly within your Terraform code.

Q.) Explain the following line of code - " ami = data.aws_ami.ubuntu.id"

Sol: 

Here's a breakdown of the code:

Code Explanation

ami = (link unavailable)

Components:

1. *ami*: This is the variable being assigned a value. ami typically stands for Amazon Machine Image.
2. *data.aws_ami.ubuntu*: This refers to a Terraform Data Source, specifically the aws_ami data source, which retrieves information about an Amazon Machine Image (AMI). The ubuntu part is likely a filter or a specific AMI being referenced.
3. *.id*: This accesses the id attribute of the aws_ami data source, which returns the ID of the matched AMI.

What the Code Does:

This line of code retrieves the ID of the latest Ubuntu Amazon Machine Image (AMI) available in AWS and assigns it to the ami variable.

Context:

This code is likely part of a Terraform configuration file, used to manage infrastructure as code. The ami variable can then be used to launch an EC2 instance with the latest Ubuntu AMI.

Q.) What does **.id** in the end of the syntax does ?

Sol:

In Terraform, when you append .id to the end of a resource or data source reference, it extracts the id attribute from that resource or data source.

In other words, .id is an attribute reference that returns the unique identifier of the resource or data source.

For example, if you have a data source like this:

data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["canonical"]
}

You can reference the ID of the AMI like this:

ami_id = (link unavailable)

In this case, (link unavailable) returns the ID of the Ubuntu AMI, which is then assigned to the ami_id variable.

So, .id is a shorthand way to access the ID attribute of a resource or data source, making it easier to reference and use in your Terraform configurations.

**.id extracts the unique identifier (ID) of a resource or data source.**

It returns the ID attribute, allowing you to reference and use it in your Terraform configuration.

Similarly if we want to extract somethingelse like "Instance Type", etc ; we have to provide the same attribute in place of .id.
Example : - " ami = data.aws_ami.ubuntu.instance type"  # Verify it correctly

Here are different ways to reference the ID of an AMI in Terraform:

1. .id attribute: (link unavailable)
2. .image_id attribute: data.aws_ami.ubuntu.image_id
3. id attribute directly: (link unavailable) (same as .id)
4. Interpolation: ${(link unavailable)}
5. Output values: output "ami_id" { value = (link unavailable) }





##### This log is called a Terraform Execution Plan or Terraform Plan Output.

It's generated by Terraform when you run the command terraform apply (or terraform plan for a dry-run). The plan outlines the actions Terraform will take to create, update, or delete resources in your infrastructure.

In this specific log, you can see that Terraform plans to:

1. Create a new AWS instance (aws_instance.web) with specific properties (e.g., AMI, instance type, tags).

The plan also indicates that there are no resources to change or destroy.


**Filter results of datasource**

https://registry.terraform.io/providers/fortinetdev/fortios/latest/docs/guides/fgt_filter


**The use of the "filter" in data sources - AWS**

https://discuss.hashicorp.com/t/the-use-of-the-filter-in-data-sources/34848


**Date: 19.12.2024**

Practice: - 1

```
# Code-1 : The following code will create an ecw=2 instance in us-east-1, i:e; north virginia

provider "aws" {
  region = "us-east-1"
}

data "aws_ami" "ubuntu" {
  most_recent = true

  owners = ["amazon"]
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-20240927"]
    #"20240927" Update this value to the latest
  }
}

output "ubuntu_ami_id" {
  value = data.aws_ami.ubuntu
}

resource "aws_instance" "server" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"

  tags = {
    Name = "ubuntu_instance"
  }
}
```


```
# Code-2 : The following code will create an ecw=2 instance in us-east-, i:e; ohio region

provider "aws" {
  region = "us-east-1"
}

data "aws_ami" "ubuntu" {
  most_recent = true

  owners = ["amazon"]
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-20240927"]  
           # "20240927" Update this value to the latest 
  }
}

output "ubuntu_ami_id" {
  value = data.aws_ami.ubuntu
}

resource "aws_instance" "server" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"

  tags = {
    Name = "ubuntu_instance"
  }
}
```

**Practice-2**

```
# Here's the modified code to create two AWS instances, one in us-east-1 and another in us-east-2:



# Provider for us-east-1

provider "aws" {
  alias  = "east1"
  region = "us-east-1"
}

# Provider for us-east-2

provider "aws" {
  alias  = "east2"
  region = "us-east-2"
}

# Data source for Ubuntu AMI in us-east-1

data "aws_ami" "ubuntu_east1" {
  provider = aws.east1
  most_recent = true
  owners = ["amazon"]
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-20240927"]
  }
}

# Data source for Ubuntu AMI in us-east-2

data "aws_ami" "ubuntu_east2" {
  provider = aws.east2
  most_recent = true
  owners = ["amazon"]
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-20240927"]
  }
}

# Output the AMI IDs
output "ubuntu_ami_id_east1" {
  value = (data.aws_ami.ubuntu_east1)
}

output "ubuntu_ami_id_east2" {
  value = (data.aws_ami.ubuntu_east2)
}

# Create instance in us-east-1

resource "aws_instance" "server_east1" {
  provider      = aws.east1
  ami            = (data.aws_ami.ubuntu_east1.id)
  instance_type = "t2.micro"
  tags = {
    Name = "ubuntu_instance_east1"
  }
}

# Create instance in us-east-2
resource "aws_instance" "server_east2" {
  provider      = aws.east2
  ami            = (data.aws_ami.ubuntu_east2.id)
  instance_type = "t2.micro"
  tags = {
    Name = "ubuntu_instance_east2"
  }
}

```




**Practice-3**

#### How to print only AMI Id and not other logs.


#### See the Output part in this code compared to the above code,how it is written in the code.

```
# Provider for us-east-1

provider "aws" {
  alias  = "east1"
  region = "us-east-1"
}

# Provider for us-east-2

provider "aws" {
  alias  = "east2"
  region = "us-east-2"
}

# Data source for Ubuntu AMI in us-east-1

data "aws_ami" "ubuntu_east1" {
  provider = aws.east1
  most_recent = true
  owners = ["amazon"]
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-20230516"]
  }
}

# Data source for Ubuntu AMI in us-east-2

data "aws_ami" "ubuntu_east2" {
  provider = aws.east2
  most_recent = true
  owners = ["amazon"]
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-20230516"]
  }
}

# Output the AMI IDs    See the Output part in this code compared to the above code,how it is written.

output "ubuntu_ami_id_east1" {
  value = {
    id         = data.aws_ami.ubuntu_east1.id
    image_id   = data.aws_ami.ubuntu_east1.image_id
  }
}

output "ubuntu_ami_id_east22" {
  value = {
    id         = data.aws_ami.ubuntu_east2.id
    image_id   = data.aws_ami.ubuntu_east2.image_id
  }
}


# Create instance in us-east-1
resource "aws_instance" "server_east1" {
  provider      = aws.east1
  ami            = (data.aws_ami.ubuntu_east1.id)
  instance_type = "t2.micro"
  tags = {
    Name = "ubuntu_instance_east1"
  }
}

# Create instance in us-east-2
resource "aws_instance" "server_east2" {
  provider      = aws.east2
  ami            = (data.aws_ami.ubuntu_east2.id)
  instance_type = "t2.micro"
  tags = {
    Name = "ubuntu_instance_east2"
  }
}
```


**Following is the output that is displayed in the CLI when the terraform apply command is ran, it displays only the id and image_id removing other things in the log**

```Apply complete! Resources: 2 added, 0 changed, 2 destroyed.

Outputs:

ubuntu_ami_id_east1 = {
  "id" = "ami-053b0d53c279acc90"
  "image_id" = "ami-053b0d53c279acc90"
}
ubuntu_ami_id_east22 = {
  "id" = "ami-024e6efaf93d85776"
  "image_id" = "ami-024e6efaf93d85776"
}
```

**Gemini AI**

```
output "ubuntu_ami_id_east1" {
  value = {
    id         = data.aws_ami.ubuntu_east1.id
    image_id   = data.aws_ami.ubuntu_east1.image_id
  }
}

data "aws_ami" "ubuntu_east1" {
  most_recent = true
  owners      = ["099720109477"] # Canonical
  filters = {
    name = "ubuntu/images/hvm-ssd/ubuntu-focal-22.04-amd64-server-*"
    virtualization-type = "hvm"
  }
}
```


Explanation:

Data Source:

data "aws_ami" "ubuntu_east1": This data source fetches information about the latest Ubuntu AMI in the us-east-1 region.
most_recent = true: Specifies that we want the most recent AMI.
owners = ["099720109477"]: Filters the AMI to those owned by Canonical, the official provider of Ubuntu.
filters: Further filters the AMI based on its name and virtualization type.
Output:

output "ubuntu_ami_id_east1": Defines an output block named ubuntu_ami_id_east1.
value: Specifies the value of the output, which is a map containing the id and image_id of the fetched AMI.
data.aws_ami.ubuntu_east1.id: References the id attribute of the fetched AMI.
data.aws_ami.ubuntu_east1.image_id: References the image_id attribute of the fetched AMI.
Note:

Replace "099720109477" with the correct owner ID if you're using a different AMI provider.
Adjust the filters block to match the specific AMI you need.
Ensure that you have the necessary AWS provider configuration set up in your Terraform configuration.
This code will dynamically fetch the latest Ubuntu AMI ID and image ID in the us-east-1 region and make them available as output values in your Terraform configuration.
**Practice-4**



