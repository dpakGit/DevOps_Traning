
### Variable Definitions Files -  (.tfvars) 

#### Assigning Values to Root Module Variables: - Doc umentation is a must read , very important.

https://developer.hashicorp.com/terraform/language/values/variables#assigning-values-to-root-module-variables

#### Variable Definitions (.tfvars) Files:

https://developer.hashicorp.com/terraform/language/values/variables#variable-definitions-tfvars-files

Linux, Mac OS, and UNIX:

```
terraform apply -var-file="uat.tfvars" or prod.tfvar

```


### How Terraform main .tf file fetches variable values from variable.tf file.



In Terraform, variables are shared between files using the variable block. Here's how (link unavailable) fetches variable values from (link unavailable):

Variable Declaration

In (link unavailable), you declare variables using the variable block:


#### variable.tf

variable "image_id" {
  type = string
  default = "ami-abc-123"
}

variable "zones" {
  type = list(string)
  default = ["us-east-1a", "us-east-1b"]
}

variable "myname" {
  type = string
  default = "mydefault-instances"
}
``"

**Variable Reference**

In `(link unavailable)`, you reference these variables using the `var` keyword followed by the variable name:


(link unavailable)
provider "aws" {
region = "us-east-1"
}

resource "aws_instance" "webs" {
count = length(var.zones)
ami = var.image_id
instance_type = "t2.micro"
availability_zone = var.zones[count.index]
tags = {
Name = "${join("-", tolist([var.myname]))}-${count.index+1}"
Team = "DevOps"
}
}


**How Terraform Links Variables**

When Terraform runs, it:

1. Loads all `.tf` files in the working directory.
2. Resolves variable declarations in `(link unavailable)`.
3. Replaces variable references in `(link unavailable)` with their corresponding values.

Terraform's variable scope is global, meaning variables declared in `(link unavailable)` are accessible in all `.tf` files within the same working directory.

**Best Practices**

* Keep variable declarations separate from resource configurations.
* Use meaningful variable names and descriptions.
### * Use default values for optional variables.

By following these practices, you'll maintain clean, reusable, and scalable Terraform configurations.

Do you have further questions on Terraform variables or configurations?


Meaning of the following sentence "Use default values for optional variables."


The sentence "Use default values for optional variables" means:

Optional Variables: Variables that are not required to be explicitly set by the user.

Default Values: Pre-defined values assigned to optional variables in case they are not provided by the user.

In other words, when declaring variables in Terraform (or other configuration files), it's a good practice to provide default values for variables that are:

1. Not critical to the configuration.
2. Can have a reasonable fallback value.
3. Don't require explicit user input.

Benefits of using default values for optional variables:

1. Simplifies configuration: Users don't need to provide values for non-essential variables.
2. Reduces errors: Default values ensure consistent behavior even if users forget to set optional variables.
3. Improves maintainability: Default values make it clear what values are expected or recommended.

Example:


variable "instance_type" {
  type = string
  default = "t2.micro" # default value for optional variable
}


In this case, instance_type is an optional variable with a default value of "t2.micro". If the user doesn't provide a value, Terraform will use the default value.

Best practices:

1. Document optional variables and their default values.
2. Use meaningful default values that make sense for your configuration.
3. Keep default values up-to-date and consistent across your configuration.

Do you have further questions on Terraform variables or configuration best practices?
....................................

Here's a step-by-step explanation of how Terraform fetches variable values from (link unavailable) to (link unavailable):

Step 1: Loading Configuration Files

Terraform loads all .tf files in the working directory, including:

- (link unavailable)
- (link unavailable)

Step 2: Parsing Variable Declarations

Terraform parses the variable blocks in (link unavailable), creating a variable scope:

- image_id = "ami-abc-123" (string)
- zones = ["us-east-1a", "us-east-1b"] (list(string))
- myname = "mydefault-instances" (string)

Step 3: Resolving Variable References

In (link unavailable), Terraform replaces variable references (var.) with their corresponding values:

- var.image_id → "ami-abc-123"
- var.zones → ["us-east-1a", "us-east-1b"]
- var.myname → "mydefault-instances"

Step 4: Evaluating Expressions

Terraform evaluates expressions using the resolved variable values:

- length(var.zones) → 2
- join("-", tolist([var.myname])) → "mydefault-instances"
- var.zones[count.index] → "us-east-1a" (for first instance), "us-east-1b" (for second instance)

Result

Terraform uses these resolved values to create:

- 2 aws_instance resources (webs) with:
    - ami = "ami-abc-123"
    - instance_type = "t2.micro"
    - availability_zone = "us-east-1a" and "us-east-1b"
    - tags = {"Name": "mydefault-instances-1" and "mydefault-instances-2", "Team": "DevOps"}

By separating variable declarations from resource configurations, you've made your Terraform code modular, reusable, and easier to maintain.

Do you have further questions on Terraform variables or configurations?
