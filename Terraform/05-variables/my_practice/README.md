
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


# Variables on the Command Line

https://developer.hashicorp.com/terraform/language/values/variables#variables-on-the-command-line


#### Practice Date: 2.11.2024
root@ip-172-31-27-115:/home/ubuntu/DevOps_Class/Terraform/05-variables/.tfvars-files/case-2# cat main.tf && cat variable.tf 
provider "aws" {
 region = "us-east-1"
}

resource "aws_instance" "webs" {
 ami = var.image_id
 instance_type = "t2.micro"
 availability_zone = var.zones

  tags = { 
   Name = "HelloWorld"
   Team = "DevOps"
  } 
}
variable "image_id" {
 type = string
 default = "ami-0866a3c8686eaeeba"   # Ubuntu Server 24.04 LTS (HVM),EBS General Purpose (SSD) Volume Type.
}


variable "zones" {
  type = string
}




variable "myname" {
 type = string
 default = "mydefault-instances"
}


**command**:
terraform apply -var="zones=us-east-1c" -auto-approve   # This command will create an instance in the given zone



### 2nd practice today: Passing multiple values of one variable

**Command**
terraform apply -var='zones_list=["us-east-1c","us-east-1d"]' -auto-approve

root@ip-172-31-27-115:/home/ubuntu/DevOps_Class/Terraform/05-variables/.tfvars-files/case-2# cat main.tf && cat variable.tf 
provider "aws" {
 region = "us-east-1"
}

resource "aws_instance" "webs" {
 count         = length(var.zones_list)
 ami = var.image_id
 instance_type = "t2.micro"
 availability_zone = var.zones_list[count.index]


  tags = { 
   Name = "Test-instance"
   Team = "DevOps"
  } 
}


variable "image_id" {
 type = string
 default = "ami-0866a3c8686eaeeba"   # Ubuntu Server 24.04 LTS (HVM),EBS General Purpose (SSD) Volume Type.
}


variable "zones_list" {
  type = list(string)
}




variable "myname" {
 type = string
 default = "mydefault-instances"
}


**Notes:**

Source: MetaAI

### How to use "specify individual variables on the command line, use the -var option"

**1.**

The -var option is used in various command-line tools to specify individual variables or values. The exact usage may vary depending on the tool, but here's a general outline:

Syntax:

command -var variable_name=value

Breakdown:

- command: The command or tool you're using (e.g., terraform, ansible, docker, etc.)
- -var: The option flag indicating you want to specify a variable
- variable_name: The name of the variable you want to set
- value: The value you want to assign to the variable

Examples:

1. Terraform:

bash
terraform apply -var region=us-west-2 -var instance_type=t2.micro

Here, region and instance_type are variables, and us-west-2 and t2.micro are their respective values.

1. Ansible:

bash
ansible-playbook -e "db_host=localhost" -e "db_port=5432" playbook.yml

In this case, db_host and db_port are variables, and localhost and 5432 are their values.

1. Docker:

bash
docker run -e DATABASE_URL=postgres://user:pass@host:port/dbname myimage

Here, DATABASE_URL is a variable, and postgres://user:pass@host:port/dbname is its value.

Tips:

- You can specify multiple variables by repeating the -var option.
- Variable names are usually case-sensitive.
- Values can be strings, numbers, booleans, or other data types, depending on the tool and variable requirements.
- Some tools may support alternative syntax, such as -e or --variable, so check the documentation for the specific tool you're using.

If you provide more context or specify the tool you're working with, I can offer more tailored guidance!


**2.**

#### How to pass variables Variables on the Command Line in terraform

In Terraform, you can pass variables on the command line using the -var or -var-file options. Here's how:

*Using -var option:*


bash
terraform apply -var "variable_name=value"


- Replace variable_name with the actual name of the variable.
- Replace value with the desired value for the variable.

Example:


bash
terraform apply -var "region=us-west-2" -var "instance_type=t2.micro"


*Using -var-file option:*

Create a file (e.g., terraform.tfvars) containing variable assignments:


region = "us-west-2"
instance_type = "t2.micro"


Then, run Terraform with the -var-file option:


bash
terraform apply -var-file=terraform.tfvars


Multiple variable files:

You can specify multiple variable files using the -var-file option multiple times:


bash
terraform apply -var-file=terraform.tfvars -var-file=override.tfvars


Variable precedence:

Terraform follows this order of precedence for variable values:

1. Command-line -var options
2. -var-file options
3. Environment variables (TF_VAR_name)
4. Default values in (link unavailable) files

Best practices:

- Use -var for sensitive or dynamic values.
- Use -var-file for static or shared variable configurations.
- Keep variable files (.tfvars) separate from Terraform configuration files (.tf).

Additional options:

- -var-file can also load variables from JSON files using the .tfvars.json extension.
- Terraform 0.14 and later supports TF_VAR_name environment variables.

For more information, refer to the Terraform documentation on (link unavailable).


**3.**

terraform apply -var="image_id=ami-abc123"

If the above is the command then the respective main.tf file and otherfiles are ?

Here's an example of what the corresponding (link unavailable) file and other files might look like:

(link unavailable)

terraform
# Configure the AWS Provider
provider "aws" {
  region = "us-west-2" # Replace with your desired region
}

# Use the image_id variable
resource "aws_instance" "example" {
  ami           = var.image_id
  instance_type = "t2.micro"
}

# Declare the image_id variable
variable "image_id" {
  type = string
}


terraform.tfvars (optional)

terraform
# You can also define default values for variables here
image_id = "ami-def456"


File structure

.
├── (link unavailable)
├── terraform.tfvars (optional)
├── (link unavailable) (optional)


(link unavailable) (optional)

terraform
# If you want to keep variables separate from (link unavailable)
variable "image_id" {
  type = string
}


In this example:

- (link unavailable) defines the AWS provider, an EC2 instance resource, and the image_id variable.
- terraform.tfvars provides default values for variables (optional).
- (link unavailable) declares variables separately (optional).

When you run terraform apply -var="image_id=ami-abc123", Terraform will:

1. Load (link unavailable) and other configuration files.
2. Override the default image_id value (if defined in terraform.tfvars) with ami-abc123.
3. Create an EC2 instance with the specified image_id.

Additional files

Depending on your project's complexity, you might also have:

- (link unavailable): Defines output values.
- modules/: Reusable modules for organizing configuration.
- (link unavailable): Configures Terraform's backend (e.g., S3, remote state).

Keep in mind that this is a simplified example. Your project may require additional files and configuration depending on its specific needs.

Would you like me to elaborate on any of these files or concepts?


**4**

terraform apply -var="zones=us-east-1c"

If the above is the command then the respective main.tf file and otherfiles are ?

Here's an example of what the corresponding (link unavailable) file and other files might look like:

(link unavailable)

terraform
# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

# Declare the zones variable
variable "zones" {
  type = string
}

# Use the zones variable
resource "aws_instance" "example" {
  ami           = "ami-abc123"
  instance_type = "t2.micro"
  availability_zone = var.zones
}


terraform.tfvars (optional)

terraform
# You can also define default values for variables here
# zones = "us-east-1a"


File structure

.
├── (link unavailable)
├── terraform.tfvars (optional)


In this example:

- (link unavailable) defines the AWS provider, an EC2 instance resource, and the zones variable.
- terraform.tfvars provides default values for variables (optional).

When you run terraform apply -var="zones=us-east-1c", Terraform will:

1. Load (link unavailable) and other configuration files.
2. Override the default zones value (if defined in terraform.tfvars) with us-east-1c.
3. Create an EC2 instance in the specified availability zone.

Additional files

Depending on your project's complexity, you might also have:

- (link unavailable): Defines output values.
- modules/: Reusable modules for organizing configuration.
- (link unavailable): Configures Terraform's backend (e.g., S3, remote state).
- (link unavailable): Declares variables separately (optional).

Tips

- Use type = list(string) if you need to specify multiple zones.
- Use availability_zone = var.zones[0] to select the first zone from a list.
- Validate zone values using validation blocks in (link unavailable).

Would you like me to elaborate on any of these files or concepts?


**5**

#### Practice Date: - 14.11.2024


Source: Meta AI

1.
explain the following terraform command - "resource "aws_instance" "web" {
  count         = 2
  ami           = "ami-0cd59ecaf368e5ccf"
  instance_type = "t2.micro"

  tags = {
    Name = "HelloWorld"
    Name = var.instance_name
    Team = "DevOps"
  }
}"


Here's a breakdown of the Terraform command:


resource "aws_instance" "web" {
  count = 2
  ami           = "ami-0cd59ecaf368e5ccf"
  instance_type = "t2.micro"

  tags = {
    Name = "HelloWorld"
    Name = var.instance_name
    Team = "DevOps"
  }
}


Resource Block

- resource: Keyword indicating a resource definition.
- aws_instance: Resource type (AWS EC2 instance).
- web: Resource name (identifier).

Resource Properties

- count = 2: Creates 2 identical instances.
- ami = "ami-0cd59ecaf368e5ccf": Specifies the Amazon Machine Image (AMI) ID.
- instance_type = "t2.micro": Defines the instance type.

Tags

- tags = { ... }: Block for assigning tags to the resource.
    - Name = "HelloWorld": Assigns a static tag value.
    - Name = var.instance_name: Error: Duplicate key. Terraform will throw an error because you can't have multiple tags with the same key.
    - Team = "DevOps": Assigns a static tag value.

Issues

1. Duplicate Name tag key.
2. Using both static and dynamic values for the Name tag.

Corrected Version


resource "aws_instance" "web" {
  count = 2
  ami           = "ami-0cd59ecaf368e5ccf"
  instance_type = "t2.micro"

  tags = {
    Name = var.instance_name
    Team = "DevOps"
  }
}


Or, if you want to use both values:


resource "aws_instance" "web" {
  count = 2
  ami           = "ami-0cd59ecaf368e5ccf"
  instance_type = "t2.micro"

  tags = {
    Name        = "${var.instance_name}-HelloWorld"
    Team        = "DevOps"
  }
}


Best Practices

1. Use meaningful resource names.
2. Use variables for reusable values.
3. Avoid hardcoding sensitive information.
4. Use Terraform's built-in functions for consistent tagging.

Variables Declaration

Declare the instance_name variable in a separate file or within the same configuration file:


variable "instance_name" {
  type = string
}

Q. why terraform is choosing  var.instance_name instead of  "HelloWorld":  a static tag value
In Terraform, when you define multiple values for the same tag key (Name), the last assignment wins.

In your original code:

tags = {
  Name = "HelloWorld"
  Name = var.instance_name
  Team = "DevOps"
}

Terraform will choose var.instance_name over "HelloWorld" because it's the last assignment.

This behavior is known as "last one wins" or "override" semantics.

Why Terraform chooses the variable over the static value:

1. Terraform's configuration language is designed to prioritize dynamic values over static ones.
2. Variables (var.instance_name) are meant to be reusable and flexible, whereas static values ("HelloWorld") are, well, static.
3. By choosing the variable, Terraform allows you to easily change the value in one place (the variable declaration) rather than updating multiple static values throughout your configuration.

To prioritize the static value:

If you want to use the static value "HelloWorld" instead of var.instance_name, simply remove or comment out the variable assignment:

tags = {
  Name = "HelloWorld"
  # Name = var.instance_name
  Team = "DevOps"
}

Now, "HelloWorld" will be used as the Name tag value.

Best Practice:

To avoid conflicts, use distinct tag keys or merge values using string interpolation:

tags = {
  Name        = "${var.instance_name}-HelloWorld"
  Team        = "DevOps"
}

Q.
modify the terraform code - "provider "aws" {
  region = "us-east-1"
}


# Variable Block

variable "name" {
  type    = list(string)
  default = ["dev", "test"]

}



resource "aws_instance" "web" {
  ami           = "ami-0cd59ecaf368e5ccf"
  instance_type = "t2.micro"
  count         = 2
  tags = {
    Name = var.name
    Team = "DevOps"
  }
}"

Here's the modified Terraform code:


terraform
# Provider Block
provider "aws" {
  region = "us-east-1"
}

# Variable Block
variable "name" {
  type        = list(string)
  default     = ["dev", "test"]
}

# Resource Block
resource "aws_instance" "web" {
  ami           = "ami-0cd59ecaf368e5ccf"
  instance_type = "t2.micro"
  count         = length(var.name)

  tags = {
    Name = var.name[count.index]
    Team = "DevOps"
  }
}
``'

**Changes Made:**

1.  `count = length(var.name)`: This ensures the number of instances created matches the number of names in the list.
2.  `Name = var.name[count.index]`: This assigns each instance a unique name from the list.

**Explanation:**

1.  The `provider` block specifies the AWS region.
2.  The `variable` block defines a list of strings (`name`) with a default value.
3.  The `resource` block creates AWS EC2 instances.
4.  `count` creates multiple instances based on the list length.
5.  `tags` assigns metadata to the instances.

**Benefits:**

1.  Dynamic instance creation based on the list.
2.  Unique names assigned to each instance.

**Tips:**

1.  Use meaningful variable names.
2.  Adjust the `ami` and `instance_type` as needed.
3.  Consider adding additional tags or configuration options.

Run `terraform apply` to create the infrastructure!

Q. explain the command "count         = length(var.name)"
In Terraform, count = length(var.name) is used to dynamically determine the number of resources to create based on the length of a list variable.

Breakdown:

1. count: This is a meta-argument in Terraform that specifies the number of resource instances to create.
2. length(): This is a built-in Terraform function that returns the number of elements in a list or string.
3. var.name: This refers to the name variable declared in the Terraform configuration, which is a list of strings.

How it works:

1. Terraform evaluates the length(var.name) expression, which returns the number of elements in the name list.
2. The result is assigned to the count meta-argument.
3. Terraform creates multiple instances of the resource (in this case, aws_instance) equal to the count value.

Example:

If var.name is ["dev", "test", "prod"], then:

1. length(var.name) returns 3.
2. count is set to 3.
3. Terraform creates 3 instances of aws_instance.

Benefits:

1. Dynamic resource creation based on variable length.
2. Simplifies configuration management.
3. Reduces duplication.

Common use cases:

1. Creating multiple resources with similar configurations.
2. Dynamic scaling of infrastructure.
3. Configuring load balancers or auto-scaling groups.

Terraform documentation:

- count meta-argument: (link unavailable)
- length() function: (link unavailable)


Q. why "count = length(var.name)" was used and not "count = 2" in the above configuration file

count = length(var.name) was used instead of count = 2 for flexibility and scalability reasons:

*Reasons for using count = length(var.name):*

1. Dynamic configuration: The length of the var.name list might change in the future. Using length(var.name) ensures the correct number of resources are created without manual updates.

2. Reusability: This approach allows the same configuration file to be reused with different list lengths.

3. Automation: It enables automation tools to modify the var.name list without requiring manual updates to the count value.

*Consequences of using count = 2:*

1. Static configuration: The configuration file would only create 2 resources, even if the var.name list grows or shrinks.

2. Manual updates: Changes to the var.name list would require manual updates to the count value.

3. Error-prone: Mismatch between count and var.name length could lead to errors or unintended behavior.

Best practices:

1. Use dynamic expressions like length(var.name) when working with lists.

2. Avoid hardcoding values when possible.

3. Emphasize flexibility and reusability in configuration files.

By using count = length(var.name), the configuration file becomes more adaptable, efficient, and scalable.













