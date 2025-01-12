Q) Correct the error -  Error: expected "cidr_block" to contain a network Value with between 16 and 28 significant bits, got: 30
│ 
│   with aws_vpc.my_vpc,
│   on ec2.tf line 3, in resource "aws_vpc" "my_vpc":
│    3:   cidr_block = "10.0.0.0/30"


SOL:
The error message indicates that the CIDR block "10.0.0.0/30" has 30 significant bits, but AWS VPC requires a CIDR block with between 16 and 28 significant bits.

To fix this error, you need to modify the cidr_block value to have between 16 and 28 significant bits. Here are a few examples of valid CIDR blocks:

- "10.0.0.0/16"
- "10.0.0.0/24"
- "10.0.0.0/28"

Here's the corrected code:


resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/16"
}


Choose a CIDR block that fits your networking requirements and modify the cidr_block value accordingly.

Q)
Error: creating EC2 Instance: operation error EC2: RunInstances, https response error StatusCode: 400, RequestID: d84664f4-fd88-4048-92e7-d0843678f050, api error InvalidParameterValue: Address 10.0.0.6 does not fall within the subnet's address range
│ 
│   with aws_instance.ec2_test[5],
│   on ec2.tf line 7, in resource "aws_instance" "ec2_test":
│    7: resource "aws_instance" "ec2_test" {
│ 

SOL:
The error message indicates that the private IP address "10.0.0.6" you're trying to assign to the EC2 instance does not fall within the subnet's address range.

To fix this error, you need to ensure that the private IP address you're assigning is within the subnet's CIDR block. Here are the steps to resolve the issue:

1. Check the subnet's CIDR block.
2. Verify that the private IP address "10.0.0.6" falls within the subnet's CIDR block.
3. If it doesn't, update the private_ip argument in the aws_instance resource to an IP address within the subnet's CIDR block.

Here's an example:


resource "aws_instance" "ec2_test" {
  // ...
  private_ip = "10.0.1.6" // Update this to an IP within the subnet's CIDR block
  // ...
}


Alternatively, you can remove the private_ip argument and let AWS automatically assign an available IP address within the subnet:


resource "aws_instance" "ec2_test" {
  // ...
  // Remove the private_ip argument
  // ...
}

Q)
Modify the code such that the instances are created only in the following cidr range "10.0.0.0/28" - Following is the code -  # Create VPC
resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/28"
}

# Create EC2 instances
resource "aws_instance" "ec2_test" {
  count         = length(cidrhost("10.0.0.0/28", 1))
  ami           = "ami-0e2c8caa4b6378d8c"
  instance_type = "t2.micro"

  # Use the cidrhost function to generate the IP address for each instance
#  private_ip = cidrhost("10.0.0.0/28", count.index + 1)

  depends_on = [aws_vpc.my_vpc]
  tags = {
    Name = "ec2_test-${count.index}"
    Team = "DevOps"
  }
}



output "PublicIP_ec2_test" {
  value = aws_instance.ec2_test.*.public_ip
}

output "PrivateIP_ec2_test" {
  value = aws_instance.ec2_test.*.private_ip
}


SOL:

Here's the modified code to create EC2 instances within the specified CIDR range "10.0.0.0/28":


# Create VPC
resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/28"
}

# Create subnet within the VPC
resource "aws_subnet" "my_subnet" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "10.0.0.0/28"
  availability_zone = "us-west-2a"
}

# Create EC2 instances
resource "aws_instance" "ec2_test" {
  count         = 5 # Number of instances to create
  ami           = "ami-0e2c8caa4b6378d8c"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.my_subnet.id

  # Use the cidrhost function to generate the IP address for each instance
  private_ip = cidrhost("10.0.0.0/28", count.index + 1)

  depends_on = [aws_vpc.my_vpc]

  tags = {
    Name = "ec2_test-${count.index}"
    Team = "DevOps"
  }
}

output "PublicIP_ec2_test" {
  value = aws_instance.ec2_test.*.public_ip
}

output "PrivateIP_ec2_test" {
  value = aws_instance.ec2_test.*.private_ip
}


In this modified code:

1. We create a subnet within the VPC using the aws_subnet resource.
2. We specify the subnet_id attribute in the aws_instance resource to create instances within the subnet.
3. We use the cidrhost function to generate IP addresses within the specified CIDR range "10.0.0.0/28" for each instance.

This ensures that the EC2 instances are created within the specified CIDR range.

Q) syntax for count=length of  the following cidr block - "cidr_block        = "10.0.0.0/28""

SOL:
To get the count of available IP addresses in a CIDR block, you can use the following syntax:


count = tonumber(1 << (32 - split("/", "10.0.0.0/28")[1]))


However, this will give you the total number of IP addresses in the subnet, including the network address and broadcast address.

If you want to exclude the network address and broadcast address, you can subtract 2 from the result:


count = tonumber(1 << (32 - split("/", "10.0.0.0/28")[1])) - 2


This will give you the number of usable IP addresses in the subnet.

Here's how you can use it in your Terraform code:


resource "aws_instance" "ec2_test" {
  count = tonumber(1 << (32 - split("/", "10.0.0.0/28")[1])) - 2

  // ... other properties ...
}

Q) syntax for count attribute of the instance block =length of  the  cidr block


SOL: 
Here is the syntax:


count = tonumber(1 << (32 - split("/", "10.0.0.0/28")[1])) - 2


However, Terraform provides a simpler way to achieve this using the cidrhost function:


count = length(cidrhost("10.0.0.0/28", "1"))


Or more accurately, excluding network and broadcast addresses:


count = length(cidrhost("10.0.0.0/28", "10"))


Q)  output of public ip is following -
# Create VPC
resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/28"
}

# Create subnet within the VPC
resource "aws_subnet" "my_subnet" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "10.0.0.0/28"
  availability_zone = "us-east-1a"
}

# Create EC2 instances
resource "aws_instance" "ec2_test" {
  count         = length(cidrhost("10.0.0.0/28", "10")) # 5 # Number of instances to create
  ami           = "ami-0e2c8caa4b6378d8c"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.my_subnet.id

  # Use the cidrhost function to generate the IP address for each instance
  #  private_ip = cidrhost("10.0.0.0/28", count.index + 1)

  depends_on = [aws_vpc.my_vpc]

  tags = {
    Name = "ec2_test-${count.index}"
    Team = "DevOps"
  }
}

output "PublicIP_ec2_test" {
  value = aws_instance.ec2_test.*.public_ip
}

output "PrivateIP_ec2_test" {
  value = aws_instance.ec2_test.*.private_ip
}
for the following code -
# Create VPC
resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/28"
}

# Create subnet within the VPC
resource "aws_subnet" "my_subnet" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "10.0.0.0/28"
  availability_zone = "us-east-1a"
}

# Create EC2 instances
resource "aws_instance" "ec2_test" {
  count         = length(cidrhost("10.0.0.0/28", "10")) # 5 # Number of instances to create
  ami           = "ami-0e2c8caa4b6378d8c"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.my_subnet.id

  # Use the cidrhost function to generate the IP address for each instance
  #  private_ip = cidrhost("10.0.0.0/28", count.index + 1)

  depends_on = [aws_vpc.my_vpc]

  tags = {
    Name = "ec2_test-${count.index}"
    Team = "DevOps"
  }
}

output "PublicIP_ec2_test" {
  value = aws_instance.ec2_test.*.public_ip
}

output "PrivateIP_ec2_test" {
  value = aws_instance.ec2_test.*.private_ip
}
, modify the error

SOL: #The issue here is that the EC2 instances are not being assigned a public IP address by default. To fix this, you need to add the following line to your aws_instance resource:

```
vpc_security_group_ids = [aws_security_group.sg.id]


# And then define the security group:


resource "aws_security_group" "sg" {
  name        = "ec2_sg"
  description = "Allow inbound traffic"
  vpc_id      = aws_vpc.my_vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


# Additionally, you need to enable auto-assigning of public IP addresses to the subnet:


resource "aws_subnet" "my_subnet" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "10.0.0.0/28"
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = true
}


Here's the complete modified code:


# Create VPC
resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/28"
}

# Create subnet within the VPC
resource "aws_subnet" "my_subnet" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "10.0.0.0/28"
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = true
}

# Create security group
resource "aws_security_group" "sg" {
  name        = "ec2_sg"
  description = "Allow inbound traffic"
  vpc_id      = aws_vpc.my_vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Create EC2 instances
resource "aws_instance" "ec2_test" {
  count         = length(cidrhost("10.0.0.0/28", "10"))
  ami           = "ami-0e2c8caa4b6378d8c"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.my_subnet.id
  vpc_security_group_ids = [aws_security_group.sg.id]

  tags = {
    Name = "ec2_test-${count.index}"
    Team = "DevOps"
  }
}

output "PublicIP_ec2_test" {
  value = aws_instance.ec2_test.*.public_ip
}

output "PrivateIP_ec2_test" {
  value = aws_instance.ec2_test.*.private_ip
}
```
 
When the output of the public Ip is following:
```
PublicIP_ec2_test = [
  "",
  "",
  "",
  "",
  "",
  "",
  "",
  "",
  "",
]
```
sol:
It seems like the public IP addresses are not being assigned to the instances.

This could be because the map_public_ip_on_launch attribute is not being applied correctly or the instances are being launched in a private subnet.

Here are a few things you can try:

1. Make sure that the subnet is a public subnet. You can do this by checking the subnet's route table. If the route table has a route to the internet gateway, then it's a public subnet.

2. Make sure that the map_public_ip_on_launch attribute is set to true for the subnet.

3. Try specifying the associate_public_ip_address attribute in the aws_instance resource and set it to true.

Here's an example of how you can modify your code:

```
# Create subnet within the VPC
resource "aws_subnet" "my_subnet" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "10.0.0.0/28"
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = true
}

# Create EC2 instances
resource "aws_instance" "ec2_test" {
  count         = length(cidrhost("10.0.0.0/28", "10"))
  ami           = "ami-0e2c8caa4b6378d8c"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.my_subnet.id
  associate_public_ip_address = true
  vpc_security_group_ids = [aws_security_group.sg.id]

  tags = {
    Name = "ec2_test-${count.index}"
    Team = "DevOps"
  }
}
```

This should ensure that the instances are launched with public IP addresses.
