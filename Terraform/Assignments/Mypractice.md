## Practice

**alias** 

1) https://developer.hashicorp.com/terraform/language/providers/configuration#alias-multiple-provider-configurations

2) https://spacelift.io/blog/terraform-providers

3)  Terraform Tutorials: What is namespace / Alias  :  https://www.devopsschool.com/blog/terraform-tutorials-what-is-namespace-alias/

4) https://dev.to/devops4mecode/deploy-aws-resources-in-different-aws-account-and-multi-region-with-terraform-multi-provider-and-alias-ie9

**Source : Meta Ai**

```
Q)

Explain the following terraform code provider "aws" { 
version = "3.20"
region  = "us-west-2"
alias   = "us-west-2"
}

Solution:

This Terraform code defines an AWS provider configuration:

Provider Configuration


terraform
provider "aws" {
  version = "3.20"
  region  = "us-west-2"
  alias   = "us-west-2"
}


Explanation:

- provider "aws": Specifies that this configuration block is for the AWS provider.
- version = "3.20": Defines the version of the AWS provider to use. In this case, it's version 3.20.
- region = "us-west-2": Sets the default AWS region to use for resources created with this provider. Here, it's set to the US West (Oregon) region (us-west-2).
- alias = "us-west-2": Assigns an alias to this provider configuration. This allows you to reference this specific provider configuration elsewhere in your Terraform code.

Use Case:

This provider configuration can be used as a starting point for managing AWS resources in the us-west-2 region. You can then use this provider configuration to create resources such as EC2 instances, S3 buckets, or IAM roles.

Example:


terraform
# Configure the AWS Provider
provider "aws" {
  version = "3.20"
  region  = "us-west-2"
  alias   = "us-west-2"
}

# Create an EC2 instance using the configured provider
resource "aws_instance" "example" {
  provider = aws.us-west-2

  # ... other properties ...
}


Q)  what is the use case of "alias" and where is it used ?


Solution :

The alias attribute in a Terraform provider configuration is used to assign a unique identifier to a specific provider configuration. This allows you to:

1. Reference multiple provider configurations: When working with multiple AWS accounts, regions, or profiles, you can define separate provider configurations with unique aliases.
2. Use different provider configurations for different resources: You can specify which provider configuration to use for a particular resource by referencing its alias.

Here's an example use case:

Suppose you have two AWS accounts: one for development (dev) and one for production (prod). You want to manage resources in both accounts using Terraform.


terraform
# Provider configuration for dev account
provider "aws" {
  alias  = "dev"
  region = "us-west-2"
  profile = "dev-profile"
}

# Provider configuration for prod account
provider "aws" {
  alias  = "prod"
  region = "us-east-1"
  profile = "prod-profile"
}

# Create an S3 bucket in the dev account
resource "aws_s3_bucket" "dev-bucket" {
  provider = aws.dev
  bucket   = "dev-bucket"
}

# Create an S3 bucket in the prod account
resource "aws_s3_bucket" "prod-bucket" {
  provider = aws.prod
  bucket   = "prod-bucket"
}


In this example, we define two provider configurations with unique aliases (dev and prod). We then use these aliases to specify which provider configuration to use for each S3 bucket resource.

By using aliases, you can manage multiple provider configurations and resources in a single Terraform configuration file.


Q) Explain the use case of alias in the provider block , for example alias   = "us-west-2" ?

Solution:

In Terraform, when you specify an alias attribute in a provider block, you're creating an alternate name for that provider configuration. This allows you to:

1. Reference the same provider configuration multiple times: With an alias, you can use the same provider configuration in multiple places within your Terraform configuration.
2. Use a more descriptive or convenient name: Instead of referencing the provider configuration by its original name (e.g., aws), you can use a more descriptive alias (e.g., us-west-2).

Here's an example use case:

Suppose you have a Terraform configuration that manages resources in multiple AWS regions. You want to use the same AWS provider configuration for resources in the us-west-2 region, but you also want to be able to reference that configuration using a more descriptive name.


terraform
provider "aws" {
  region = "us-west-2"
  alias  = "us-west-2"
}

# Create an EC2 instance in the us-west-2 region
resource "aws_instance" "example" {
  provider = aws.us-west-2
  # ... other properties ...
}

# Create an S3 bucket in the us-west-2 region
resource "aws_s3_bucket" "example" {
  provider = aws.us-west-2
  # ... other properties ...
}


In this example, we define an AWS provider configuration with an alias attribute set to us-west-2. We can then use this alias to reference the provider configuration when creating resources in the us-west-2 region.

By using an alias, we can make our Terraform configuration more readable and easier to maintain.
```


**Date : 31.12.2024**

**Practice-1**

**VPC-Code**

```
resource "aws_vpc" "main" {
  cidr_block = "30.0.0.0/16" # change it to 20 ,30 etc to see the changes.
  lifecycle {
    create_before_destroy = true
  }

  tags = {
    Name = "second"
  }
}
```

Reffered Youtube video link : https://www.youtube.com/watch?v=KHVmt22OXCU 

Created a VPC with cidr block as 10.0.0.0/16.
applied the terraform apply command and created the resource.
changed or modified the cidr block from 10.0.0.0/16 to 20.0.0.0/16, and the applied the apply command , it first created the modified instance and then deleted the old one .

root@ip-172-31-31-194:/home/ubuntu/first#   t apply -auto-approve  # Terraform apply command

```
aws_vpc.main: Refreshing state... [id=vpc-08e967c0ad1a5c047]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
+/- create replacement and then destroy

Terraform will perform the following actions:

  # aws_vpc.main must be replaced
+/- resource "aws_vpc" "main" {
      ~ arn                                  = "arn:aws:ec2:us-east-1:246839783311:vpc/vpc-08e967c0ad1a5c047" -> (known after apply)
      - assign_generated_ipv6_cidr_block     = false -> null
      ~ cidr_block                           = "10.0.0.0/16" -> "20.0.0.0/16" # forces replacement
      ~ default_network_acl_id               = "acl-02edaa849dd128e43" -> (known after apply)
      ~ default_route_table_id               = "rtb-0fce54933bccead2d" -> (known after apply)
      ~ default_security_group_id            = "sg-0f70c34d8d0e09d3b" -> (known after apply)
      ~ dhcp_options_id                      = "dopt-b7951fcd" -> (known after apply)
      ~ enable_dns_hostnames                 = false -> (known after apply)
      ~ enable_network_address_usage_metrics = false -> (known after apply)
      ~ id                                   = "vpc-08e967c0ad1a5c047" -> (known after apply)
      + ipv6_association_id                  = (known after apply)
      + ipv6_cidr_block                      = (known after apply)
      + ipv6_cidr_block_network_border_group = (known after apply)
      - ipv6_netmask_length                  = 0 -> null
      ~ main_route_table_id                  = "rtb-0fce54933bccead2d" -> (known after apply)
      ~ owner_id                             = "246839783311" -> (known after apply)
        tags                                 = {
            "Name" = "first"
        }
        # (4 unchanged attributes hidden)
    }
# See the following lines, it first created then destroyed

Plan: 1 to add, 0 to change, 1 to destroy.
aws_vpc.main: Creating...
aws_vpc.main: Creation complete after 1s [id=vpc-0654cc90b0a6d77c0]
aws_vpc.main (deposed object 175a108b): Destroying... [id=vpc-08e967c0ad1a5c047]
aws_vpc.main: Destruction complete after 0s

Apply complete! Resources: 1 added, 0 changed, 1 destroyed.
```

**Practice-2**

Created an ec2 with ubuntu 20.04 instance
changed the AMI to ubuntu 24.04 
Now it changed and firt cteated the new one and destroyed the old one.


**EC2-Code**

```
resource "aws_instance" "web" {
  ami           = "ami-0e2c8caa4b6378d8c"   # ubuntu 20.04 AMI

# ami           = "ami-0f34c5ae932e6f0e4"   # ubuntu 22.04 AMI
# When using one AMI comment out the other

  instance_type = "t2.micro"
  #count = 2
  depends_on = [aws_instance.web]
  lifecycle {
    create_before_destroy = true
  }

  tags = {
    Name = "Terraform_ec2"
  }
}
```

```
root@ip-172-31-31-194:/home/ubuntu/first# t apply -auto-approve

aws_instance.web: Refreshing state... [id=i-0eb4a5e77d1260f9e]
aws_vpc.main: Refreshing state... [id=vpc-0cff3ae627adfdeac]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
+/- create replacement and then destroy

Terraform will perform the following actions:

  # aws_instance.web must be replaced
+/- resource "aws_instance" "web" {
      ~ ami                                  = "ami-0f34c5ae932e6f0e4" -> "ami-0e2c8caa4b6378d8c" # forces replacement
      ~ arn                                  = "arn:aws:ec2:us-east-1:246839783311:instance/i-0eb4a5e77d1260f9e" -> (known after apply)
      ~ associate_public_ip_address          = true -> (known after apply)
      ~ availability_zone                    = "us-east-1d" -> (known after apply)
      ~ cpu_core_count                       = 1 -> (known after apply)
      ~ cpu_threads_per_core                 = 1 -> (known after apply)
      ~ disable_api_stop                     = false -> (known after apply)
      ~ disable_api_termination              = false -> (known after apply)
      ~ ebs_optimized                        = false -> (known after apply)
      + enable_primary_ipv6                  = (known after apply)
      - hibernation                          = false -> null
      + host_id                              = (known after apply)
      + host_resource_group_arn              = (known after apply)
      + iam_instance_profile                 = (known after apply)
      ~ id                                   = "i-0eb4a5e77d1260f9e" -> (known after apply)
      ~ instance_initiated_shutdown_behavior = "stop" -> (known after apply)
      + instance_lifecycle                   = (known after apply)
      ~ instance_state                       = "running" -> (known after apply)
      ~ ipv6_address_count                   = 0 -> (known after apply)
      ~ ipv6_addresses                       = [] -> (known after apply)
      + key_name                             = (known after apply)
      ~ monitoring                           = false -> (known after apply)
      + outpost_arn                          = (known after apply)
      + password_data                        = (known after apply)
      + placement_group                      = (known after apply)
      ~ placement_partition_number           = 0 -> (known after apply)
      ~ primary_network_interface_id         = "eni-057dbda8fb9cca16a" -> (known after apply)
      ~ private_dns                          = "ip-172-31-20-14.ec2.internal" -> (known after apply)
      ~ private_ip                           = "172.31.20.14" -> (known after apply)
      ~ public_dns                           = "ec2-54-234-140-181.compute-1.amazonaws.com" -> (known after apply)
      ~ public_ip                            = "54.234.140.181" -> (known after apply)
      ~ secondary_private_ips                = [] -> (known after apply)
      ~ security_groups                      = [
          - "default",
        ] -> (known after apply)
      + spot_instance_request_id             = (known after apply)
      ~ subnet_id                            = "subnet-03c4f8316293bddf5" -> (known after apply)
        tags                                 = {
            "Name" = "Terraform_ec2"
        }
      ~ tenancy                              = "default" -> (known after apply)
      + user_data                            = (known after apply)
      + user_data_base64                     = (known after apply)
      ~ vpc_security_group_ids               = [
          - "sg-0d8da08c9115c7e2a",
        ] -> (known after apply)
        # (5 unchanged attributes hidden)

      ~ capacity_reservation_specification (known after apply)
      - capacity_reservation_specification {
          - capacity_reservation_preference = "open" -> null
        }

      ~ cpu_options (known after apply)
      - cpu_options {
          - core_count       = 1 -> null
          - threads_per_core = 1 -> null
            # (1 unchanged attribute hidden)
        }

      - credit_specification {
          - cpu_credits = "standard" -> null
        }

      ~ ebs_block_device (known after apply)

      ~ enclave_options (known after apply)
      - enclave_options {
          - enabled = false -> null
        }

      ~ ephemeral_block_device (known after apply)

      ~ instance_market_options (known after apply)

      ~ maintenance_options (known after apply)
      - maintenance_options {
          - auto_recovery = "default" -> null
        }

      ~ metadata_options (known after apply)
      - metadata_options {
          - http_endpoint               = "enabled" -> null
          - http_protocol_ipv6          = "disabled" -> null
          - http_put_response_hop_limit = 2 -> null
          - http_tokens                 = "required" -> null
          - instance_metadata_tags      = "disabled" -> null
        }

      ~ network_interface (known after apply)

      ~ private_dns_name_options (known after apply)
      - private_dns_name_options {
          - enable_resource_name_dns_a_record    = false -> null
          - enable_resource_name_dns_aaaa_record = false -> null
          - hostname_type                        = "ip-name" -> null
        }

      ~ root_block_device (known after apply)
      - root_block_device {
          - delete_on_termination = true -> null
          - device_name           = "/dev/xvda" -> null
          - encrypted             = false -> null
          - iops                  = 3000 -> null
          - tags                  = {} -> null
          - tags_all              = {} -> null
          - throughput            = 125 -> null
          - volume_id             = "vol-00086fccbca7a6fec" -> null
          - volume_size           = 8 -> null
          - volume_type           = "gp3" -> null
            # (1 unchanged attribute hidden)
        }
    }

Plan: 1 to add, 0 to change, 1 to destroy.
aws_instance.web: Creating...
aws_instance.web: Still creating... [10s elapsed]
aws_instance.web: Creation complete after 12s [id=i-07c7497793a25c64b]
aws_instance.web (deposed object 87318425): Destroying... [id=i-0eb4a5e77d1260f9e]
aws_instance.web: Still destroying... [id=i-0eb4a5e77d1260f9e, 10s elapsed]
aws_instance.web: Still destroying... [id=i-0eb4a5e77d1260f9e, 20s elapsed]
aws_instance.web: Still destroying... [id=i-0eb4a5e77d1260f9e, 30s elapsed]
aws_instance.web: Still destroying... [id=i-0eb4a5e77d1260f9e, 40s elapsed]
aws_instance.web: Still destroying... [id=i-0eb4a5e77d1260f9e, 50s elapsed]
aws_instance.web: Still destroying... [id=i-0eb4a5e77d1260f9e, 1m0s elapsed]
aws_instance.web: Destruction complete after 1m1s

Apply complete! Resources: 1 added, 0 changed, 1 destroyed.

```

**Practice-3**  ### How terraform automatically change the name or version of the VPC each time it is updated

**Source : Meta AI**

Following is to create a vpc using terraform. 

resource "aws_vpc" "main" {
  cidr_block       = "10.0.0.0/16"
lifecycle {
    create_before_destroy = true
  }

  tags = {
    Name = "first"
  }
}

let terraform automatically change the name or version of the VPC each time it is updated

**Code - 1**

In this code, ${timestamp()} is a Terraform function that generates a timestamp each time the configuration is applied. This will result in a new VPC name each time you run terraform apply.

Meaning the console name of the VPC will be followed by the time it is created

```
resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
  lifecycle {
    create_before_destroy = true
  }
  tags = {
    Name = "first-${timestamp()}"
  }
}
```

**Code - 2**

Alternatively, you can use the **uuid() function** to generate a unique identifier:

```
resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
  lifecycle {
    create_before_destroy = true
  }
  tags = {
    Name = "first-${uuid()}"
  }
}
```
Note that using either of these approaches will result in a new VPC being created each time you apply the configuration, as the name will be different. If you want to update the existing VPC instead, you'll need to use a different approach.


Q) Modify the following code so that the user can customize the uuid -resource "aws_vpc" "main" {
 ```
 cidr_block = "10.0.0.0/16"
  lifecycle {
    create_before_destroy = true
  }
  tags = {
    Name = "first-${uuid()}"
  }
}
```

**Modified Code**

```
variable "custom_uuid" {
  type        = string
  description = "Custom UUID for VPC name"
}

resource "aws_vpc" "main" {
  cidr_block = "30.0.0.0/16"
  lifecycle {
    create_before_destroy = true
  }
  tags = {
    Name = "first-${var.custom_uuid}"

  }
}
```

Command -1

```
terraform apply -auto-approve
```

When we use the apply command it will ask for a value like below:

var.custom_uuid

  Custom UUID for VPC name

  Enter a value: Version-1.0  # This is the input value, Version-1.0
  
  The input value will be the name of the VPC in the console.

 
 Or alternatively, when running terraform apply, provide the default value for the custom_uuid variable:
 
Command-2 :
  
```
terraform apply -var "custom_uuid=$(uuidgen)"
```

Output: 
This will create a random console name like the following :

first-87a3b7af-9425-4c69-8c29-e2c016996e68


Alternatively, you can hardcode the UUID value:


Command -3 : 

#### Directly pass the Resource Name in the CLI
   
```
terraform apply -var "custom_uuid=My-Custom-uuid-Name" -auto-approve
```


In place of ' My-Custom-uuid-Name ' we can give any name.

Utilizing the first and third commands enables manual renaming or versioning of the resource with each update.


**Date : - 3.1.2025**


### Terraform - The depends_on Meta-Argument

1) Terraform Docs : https://developer.hashicorp.com/terraform/language/meta-arguments/depends_on

2) Kodekloud : https://kodekloud.com/blog/terraform-depends-on-module/

3)  How to Use Terraform depends_on Meta-Argument : https://spacelift.io/blog/terraform-depends-on
   
   
**Practice :-1**

**Code-1**

The following code will create a total of six instances three Backend and three Frontend 

```
# Depends - On

provider "aws" {
  region = "us-east-1"

}

resource "aws_instance" "Frontend" {
  ami           = "ami-0cd59ecaf368e5ccf"
  instance_type = "t2.micro"

  count = 3

  depends_on = [aws_instance.east_backend]

  lifecycle {
    create_before_destroy = true
  }

  tags = {
    Name = "Frontend-${count.index}"
    Team = "DevOps"
  }
}

resource "aws_instance" "Backend" {
  ami           = "ami-0cd59ecaf368e5ccf"
  instance_type = "t2.micro"

  count = 3

  lifecycle {
    prevent_destroy = false
  }
  tags = {
    Name = "Backend-${count.index}"
    Team = "DevOps"
  }
}
```

**Code-2**
```
# Depends - On

provider "aws" {
  region = "us-east-1"

}
resource "aws_instance" "Frontend" {
  ami           = "ami-0cd59ecaf368e5ccf"
  instance_type = "t2.micro"

  count = 3

  depends_on = [aws_instance.Backend]

  lifecycle {
    create_before_destroy = true
  }

  tags = {
    Name = "Frontend-${count.index}"
    Team = "DevOps"
  }
}

resource "aws_instance" "Backend" {
  ami           = "ami-0cd59ecaf368e5ccf"
  instance_type = "t2.micro"

  count = 1

  lifecycle {
    prevent_destroy = false
  }
  tags = {
    Name = "Backend-${count.index}"
    Team = "DevOps"
  }
}
```

**Apply command Output**

```
.
.
.
Apply complete! Resources: 4 added, 0 changed, 0 destroyed.
root@ip-172-31-86-188:/home/ubuntu/practice# terraform state list
aws_instance.Backend[0]
aws_instance.Frontend[0]
aws_instance.Frontend[1]
aws_instance.Frontend[2]
```

The apply command output log indicates that even if one backend instance is created all the three Frontend instances will be created. So Here depend on is not working

**Code-3**

```
# Depends - On

provider "aws" {
  region = "us-east-1"

}
resource "aws_instance" "Frontend" {
  ami           = "ami-0cd59ecaf368e5ccf"
  instance_type = "t2.micro"

  count = 2

  depends_on = [aws_instance.Backend]

  lifecycle {
    create_before_destroy = true
  }

  tags = {
    Name = "Frontend-${count.index}"
    Team = "DevOps"
  }
}

resource "aws_instance" "Backend" {
  ami           = "ami-0cd59ecaf368e5ccf"
  instance_type = "t2.micro"

  count = 0

  lifecycle {
    prevent_destroy = false
  }
  tags = {
    Name = "Backend-${count.index}"
    Team = "DevOps"
  }
}
```

**Apply command Output**

```
Plan: 2 to add, 0 to change, 0 to destroy.
aws_instance.Frontend[0]: Creating...
aws_instance.Frontend[1]: Creating...
aws_instance.Frontend[0]: Still creating... [10s elapsed]
aws_instance.Frontend[1]: Still creating... [10s elapsed]
aws_instance.Frontend[1]: Creation complete after 13s [id=i-0f7c645ccf5642349]
aws_instance.Frontend[0]: Creation complete after 13s [id=i-0fe3a93da95d6e0d9]

Apply complete! Resources: 2 added, 0 changed, 0 destroyed.
root@ip-172-31-86-188:/home/ubuntu/practice# terraform state list
aws_instance.Frontend[0]
aws_instance.Frontend[1]
```
Even if count=0 in the backend it is creating the frontend instances.


#### Code-4   

**Source : Meat AI**

To create a frontend instance for every backend instance and prevent frontend instance creation when no backend instances exist, you can modify the count attribute in the aws_instance "Frontend" resource block to reference the count attribute of the aws_instance "Backend" resource block.

```
provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "Backend" {
  ami           = "ami-0cd59ecaf368e5ccf"
  instance_type = "t2.micro"
  count         = 3

  lifecycle {
    prevent_destroy = false
  }

  tags = {
    Name = "Backend-${count.index + 1}"
    Team = "DevOps"
  }
}

resource "aws_instance" "Frontend" {
  ami           = "ami-0cd59ecaf368e5ccf"
  instance_type = "t2.micro"
  count         = length(aws_instance.Backend)

  depends_on = [aws_instance.Backend]

  lifecycle {
    create_before_destroy = true
  }

  tags = {
    Name = "Frontend-${count.index + 1}"
    Team = "DevOps"
  }
}
```

In this modified code:

- The count attribute in the aws_instance "Frontend" resource block is set to length(aws_instance.Backend), which means it will create as many frontend instances as there are backend instances.
- The depends_on attribute ensures that the frontend instances are created only after the backend instances are created.


**Apply command Output**

```
Plan: 6 to add, 0 to change, 0 to destroy.
aws_instance.Backend[2]: Creating...
aws_instance.Backend[0]: Creating...
aws_instance.Backend[1]: Creating...
aws_instance.Backend[2]: Still creating... [10s elapsed]
aws_instance.Backend[0]: Still creating... [10s elapsed]
aws_instance.Backend[1]: Still creating... [10s elapsed]
aws_instance.Backend[0]: Creation complete after 12s [id=i-0bfb86bb3cb705996]
aws_instance.Backend[1]: Creation complete after 12s [id=i-0b3da14acb04613a6]
aws_instance.Backend[2]: Creation complete after 12s [id=i-04baf15dc92ba395a]
aws_instance.Frontend[1]: Creating...
aws_instance.Frontend[2]: Creating...
aws_instance.Frontend[0]: Creating...
aws_instance.Frontend[1]: Still creating... [10s elapsed]
aws_instance.Frontend[2]: Still creating... [10s elapsed]
aws_instance.Frontend[0]: Still creating... [10s elapsed]
aws_instance.Frontend[1]: Creation complete after 12s [id=i-00cd04b1a4fde48dc]
aws_instance.Frontend[2]: Creation complete after 12s [id=i-05778e84404835fb9]
aws_instance.Frontend[0]: Creation complete after 12s [id=i-0f5b2b87240786628]

Apply complete! Resources: 6 added, 0 changed, 0 destroyed.

root@ip-172-31-86-188:/home/ubuntu/practice# t state list | nl
     1  aws_instance.Backend[0]
     2  aws_instance.Backend[1]
     3  aws_instance.Backend[2]
     4  aws_instance.Frontend[0]
     5  aws_instance.Frontend[1]
     6  aws_instance.Frontend[2]
```

#### Code-5

**Note:** In this modified code, similar to the previous example, the depends_on attribute in the Frontend resource block has been commented out to test whether it still creates the same number of Frontend instances as Backend instances.
Also read the below docs from Meta AI.

```
provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "Backend" {
  ami           = "ami-0cd59ecaf368e5ccf"
  instance_type = "t2.micro"
  count         = 3

  lifecycle {
    prevent_destroy = false
  }

  tags = {
    Name = "Backend-${count.index + 1}"
    Team = "DevOps"
  }
}

resource "aws_instance" "Frontend" {
  ami           = "ami-0cd59ecaf368e5ccf"
  instance_type = "t2.micro"
  count         = length(aws_instance.Backend)

  # depends_on = [aws_instance.Backend]       

  lifecycle {
    create_before_destroy = true
  }

  tags = {
    Name = "Frontend-${count.index + 1}"
    Team = "DevOps"
  }
}
```

**Apply command Output**

``` Plan: 6 to add, 0 to change, 0 to destroy.
aws_instance.Backend[0]: Creating...
aws_instance.Backend[1]: Creating...
aws_instance.Backend[2]: Creating...
aws_instance.Backend[0]: Still creating... [10s elapsed]
aws_instance.Backend[1]: Still creating... [10s elapsed]
aws_instance.Backend[2]: Still creating... [10s elapsed]
aws_instance.Backend[0]: Creation complete after 12s [id=i-086715708dde82382]
aws_instance.Backend[1]: Creation complete after 12s [id=i-072769d6fe0a765c8]
aws_instance.Backend[2]: Creation complete after 13s [id=i-068bd0174fc23e8e3]
aws_instance.Frontend[1]: Creating...
aws_instance.Frontend[2]: Creating...
aws_instance.Frontend[0]: Creating...
aws_instance.Frontend[1]: Still creating... [10s elapsed]
aws_instance.Frontend[2]: Still creating... [10s elapsed]
aws_instance.Frontend[0]: Still creating... [10s elapsed]
aws_instance.Frontend[2]: Creation complete after 12s [id=i-0ff46d5ad1009ff4b]
aws_instance.Frontend[0]: Creation complete after 12s [id=i-09449eafa6d9c984f]
aws_instance.Frontend[1]: Creation complete after 12s [id=i-0973592544ad33b1a]

Apply complete! Resources: 6 added, 0 changed, 0 destroyed.
root@ip-172-31-30-55:/home/ubuntu# 
root@ip-172-31-30-55:/home/ubuntu# 
root@ip-172-31-30-55:/home/ubuntu# 
root@ip-172-31-30-55:/home/ubuntu# 
root@ip-172-31-30-55:/home/ubuntu# 
root@ip-172-31-30-55:/home/ubuntu# 
root@ip-172-31-30-55:/home/ubuntu# t state list
aws_instance.Backend[0]
aws_instance.Backend[1]
aws_instance.Backend[2]
aws_instance.Frontend[0]
aws_instance.Frontend[1]
aws_instance.Frontend[2] ```


**Source Meta AI** 

Since you've set the count parameter of the aws_instance "Frontend" resource to length(aws_instance.Backend), Terraform will automatically create the frontend instances after the backend instances are created.

In this case, the depends_on = [aws_instance.Backend] attribute is not strictly necessary, as the count parameter already establishes an implicit dependency between the frontend and backend instances.

However, including the depends_on attribute can still be useful for clarity and explicitness, as it clearly communicates the dependency between the two resources.

So, while it's not required, leaving it in can make the code more readable and maintainable.

