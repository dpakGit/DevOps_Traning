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

```
Plan: 6 to add, 0 to change, 0 to destroy.
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
root@ip-172-31-30-55:/home/ubuntu# t state list
aws_instance.Backend[0]
aws_instance.Backend[1]
aws_instance.Backend[2]
aws_instance.Frontend[0]
aws_instance.Frontend[1]
aws_instance.Frontend[2]
```



**Source Meta AI** 

Since you've set the count parameter of the aws_instance "Frontend" resource to length(aws_instance.Backend), Terraform will automatically create the frontend instances after the backend instances are created.

In this case, the depends_on = [aws_instance.Backend] attribute is not strictly necessary, as the count parameter already establishes an implicit dependency between the frontend and backend instances.

However, including the depends_on attribute can still be useful for clarity and explicitness, as it clearly communicates the dependency between the two resources.

So, while it's not required, leaving it in can make the code more readable and maintainable.


**Practice Date : 4.1.2025**

**Error:**

I got the following error as the AMI for all resources was same bu the zones are different. 

**Note :** AMI's for the same OS are different for different regions.

```
verify the error and give a solution - │ Error: Error launching source instance: InvalidParameterValue: Invalid availability zone: [us-east-2a]
│       status code: 400, request id: f30a62ed-ab8c-4bd6-b664-919c31a9f7cb
│ 
│   with aws_instance.Backend-East-2[0],
│   on ec2.tf line 69, in resource "aws_instance" "Backend-East-2":
│   69: resource "aws_instance" "Backend-East-2" {
│ 
╵
╷
│ Error: Error launching source instance: InvalidParameterValue: Invalid availability zone: [us-east-2b]
│       status code: 400, request id: 8ed4aabc-ced6-4c4b-8120-ccba1bba5bd5
│ 
│   with aws_instance.Backend-East-2[1],
│   on ec2.tf line 69, in resource "aws_instance" "Backend-East-2":
│   69: resource "aws_instance" "Backend-East-2" {
│ 
╵
```


**Date : 6.1.2024**

```
# Provider Block

provider "aws" {
  region = "us-east-1"
}


provider "aws" {
  region = "us-east-2"
  alias  = "us-east-2"
}


# Variable Block


variable "zones_east-1" { #  Zone-1    :  N.Virginia               
  default = ["us-east-1a", "us-east-1b"]
}

data "aws_availability_zones" "available" {
  state = "available"
  filter {
    name   = "region-name"
    values = ["us-east-2"]
  }
}





# Resource Block in  US-east-1 - N.Virginia

resource "aws_instance" "Backend-East-1" {
  ami               = "ami-0e2c8caa4b6378d8c" # AMI : Ubuntu Server 24.04 LTS (HVM),EBS General Purpose (SSD) Volume Type
  instance_type     = "t2.micro"
  availability_zone =  data.aws_availability_zones.available.names[count.index]
  count             = 1

  lifecycle {
    prevent_destroy = false
  }

  tags = {
    Name = "Backend-East-1-${count.index + 1}" # Also we can name it as "Backend_N.Virginia-${count.index + 1}" or Baknd_N.Virginia               
    Team = "DevOps"
  }
}

resource "aws_instance" "Frontend-East-1" {
  ami               = "ami-0e2c8caa4b6378d8c" # AMI : Ubuntu Server 24.04 LTS (HVM),EBS General Purpose (SSD) Volume Type
  instance_type     = "t2.micro"
  availability_zone = var.zones_east-1[count.index]

  count = length(aws_instance.Backend-East-1)

  depends_on = [aws_instance.Backend-East-1]

  lifecycle {
    create_before_destroy = true
  }

  tags = {
    Name = "Frontend-East-1-${count.index + 1}"
    Team = "DevOps"
  }
}

# Resource Block in  US-east-2 - Ohio


data "aws_ami" "ubuntu" {
  most_recent = true

  owners = ["amazon"]
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }
}

resource "aws_instance" "Backend-East-2" {
  ami               = data.aws_ami.ubuntu.id
  instance_type     = "t2.micro"
 depends_on = [data.aws_availability_zones.available]

availability_zone = data.aws_availability_zones.available.names[count.index]

  count = 1

  lifecycle {
    prevent_destroy = false
  }

  tags = {
    Name = "Backend-East-2-${count.index + 1}" # "Backend_Ohio-${count.index + 1}"
    Team = "DevOps"
  }
}

resource "aws_instance" "Frontend-East-2" {
  ami               = data.aws_ami.ubuntu.id
  instance_type     = "t2.micro"
 depends_on = [data.aws_availability_zones.available]

availability_zone = data.aws_availability_zones.available.names[count.index]

  
  count = length(aws_instance.Backend-East-2)

  depends_on = [aws_instance.Backend-East-2]

  lifecycle {
    create_before_destroy = true
  }

  tags = {
    Name = "Frontend-East-2-${count.index + 1}"
    Team = "DevOps"
  }
}
```

root@ip-172-31-26-33:/home/ubuntu/prac# t fmt
╷
│ Error: Attribute redefined
│ 
│   on ec2.tf line 112, in resource "aws_instance" "Frontend-East-2":
│  112:   depends_on = [aws_instance.Backend-East-2]
│ 
│ The argument "depends_on" was already set at ec2.tf:105,2-12. Each argument may be set only once.
╵




**Source : Meta AI**

[03/01, 6:46 pm] Meta AI: Here are detailed explanations of each use case with examples:

1. Resource Dependencies

When a resource depends on another resource being created or updated first, use depends_on to establish the dependency.

Example:


hcl
resource "aws_instance" "web_server" {
  ami           = "ami-abc123"
  instance_type = "t2.micro"
}

resource "aws_security_group" "web_server_sg" {
  name        = "web_server_sg"
  description = "Security group for web server"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  depends_on = [aws_instance.web_server]
}


In this example, the aws_security_group resource depends on the aws_instance resource being created first.

2. Avoiding Resource Deletion

When deleting a resource, Terraform might try to delete dependent resources first. Use depends_on to prevent this and ensure resources are deleted in the correct order.

Example:


hcl
resource "aws_instance" "web_server" {
  ami           = "ami-abc123"
  instance_type = "t2.micro"
}

resource "aws_volume_attachment" "web_server_volume" {
  device_name  = "/dev/sdh"
  instance_id  = (link unavailable)
  volume_id     = (link unavailable)
  skip_destroy  = true

  depends_on = [aws_instance.web_server]
}


In this example, the aws_volume_attachment resource depends on the aws_instance resource. When deleting the aws_instance resource, Terraform will not delete the aws_volume_attachment resource first.

3. Handling Resource Timing Issues

In some cases, Terraform might create resources too quickly, causing issues. depends_on can help ensure resources are created in the correct order.

Example:


hcl
resource "aws_instance" "web_server" {
  ami           = "ami-abc123"
  instance_type = "t2.micro"
}

resource "aws_route53_record" "web_server_dns" {
  zone_id = aws_route53_zone.example.zone_id
  name    = "(link unavailable)"
  type    = "A"
  alias {
    name                   = aws_lb.example.dns_name
    zone_id                = aws_lb.example.zone_id
    evaluate_target_health = true
  }

  depends_on = [aws_instance.web_server]
}


In this example, the aws_route53_record resource depends on the aws_instance resource being created first.

4. External Resource Dependencies

When Terraform resources depend on external resources (e.g., manually created resources), use depends_on to establish the dependency.

Example:


hcl
resource "aws_security_group" "web_server_sg" {
  name        = "web_server_sg"
  description = "Security group for web server"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  depends_on = [aws_security_group.manual_sg]
}

resource "aws_security_group" "manual_sg" {
  // This resource is created manually outside of Terraform
  // ...
}


In this example, the aws_security_group resource depends on an external aws_security_group resource created manually.

5. Module Dependencies

In Terraform modules, depends_on can ensure resources within the module are created in the correct order.

Example:


hcl
// File: modules/web_server/main.tf
resource "aws_instance" "web_server" {
  ami           = "ami-abc123"
  instance_type = "t2.micro"
}

resource "aws_security_group" "web_server_sg" {
  name        = "web_server_sg"
  description = "Security group for web server"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  depends_on = [aws_instance.web_server]
}


In this example, within the web_server module, the aws_security_group resource depends on the aws_instance resource being created first.

6. Avoiding Circular Dependencies

Terraform can detect circular dependencies and prevent them. depends_on can help avoid these issues by explicitly defining dependencies.

Example:


hcl
resource "aws_instance" "web_server" {
  ami           = "ami-abc123"
  instance_type = "t2.micro"
}

resource "aws_security_group"

[03/01, 6:48 pm] Meta AI: Here are some more elaborate examples with explanations:

Example 1: Resource Dependencies

Suppose we have a web server that depends on a security group and an Elastic IP.


hcl
Create a security group
resource "aws_security_group" "web_server_sg" {
  name        = "web_server_sg"
  description = "Security group for web server"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

Create an Elastic IP
resource "aws_eip" "web_server_eip" {
  vpc = true
}

Create a web server that depends on the security group and Elastic IP
resource "aws_instance" "web_server" {
  ami           = "ami-abc123"
  instance_type = "t2.micro"
  vpc_security_group_ids = [(link unavailable)]
  depends_on = [aws_security_group.web_server_sg, aws_eip.web_server_eip]
}


In this example, the aws_instance resource depends on the aws_security_group and aws_eip resources. Terraform will create the security group and Elastic IP before creating the web server.

Example 2: Avoiding Resource Deletion

Suppose we have a database instance that depends on a security group.


hcl
Create a security group
resource "aws_security_group" "db_sg" {
  name        = "db_sg"
  description = "Security group for database"

  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

Create a database instance that depends on the security group
resource "aws_db_instance" "database" {
  allocated_storage    = 20
  engine                = "postgres"
  engine_version        = "12.5"
  instance_class        = "db.t2.micro"
  name                   = "mydatabase"
  username               = "myuser"
  password               = "mypassword"
  vpc_security_group_ids = [(link unavailable)]
  skip_final_snapshot    = true
  depends_on              = [aws_security_group.db_sg]
}


In this example, the aws_db_instance resource depends on the aws_security_group resource. When deleting the aws_db_instance resource, Terraform will not delete the aws_security_group resource first.

Example 3: Handling Resource Timing Issues

Suppose we have a load balancer that depends on a target group.


hcl
Create a target group
resource "aws_lb_target_group" "example" {
  name     = "example"
  port     = 80
  protocol = "HTTP"
  vpc_id   = "vpc-12345678"
}

Create a load balancer that depends on the target group
resource "aws_lb" "example" {
  name               = "example"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [(link unavailable)]
  subnets            = [(link unavailable), (link unavailable)]

  depends_on = [aws_lb_target_group.example]
}


In this example, the aws_lb resource depends on the aws_lb_target_group resource. Terraform will create the target group before creating the load balancer.

Example 4: External Resource Dependencies

Suppose we have a security group that depends on an external security group created manually.


hcl
Create a security group that depends on an external security group
resource "aws_security_group" "example" {
  name        = "example"
  description = "Security group example"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  depends_on = [aws_security_group.manual_sg]
}

External security group created manually
resource "aws_security_group" "manual_sg" {
  // This resource is created manually outside of Terraform
  // ...
}


In this example, the aws_security_group resource depends on an external aws_security_group resource created manually.

Example 5: Module Dependencies

Suppose we have a module that creates a web server and a security group.


hcl
File: modules/web_server/main.tf
resource "aws_instance" "web_server" {
  ami           = "ami-abc123"
  instance_type = "t2.micro"
}

resource "aws_security_group" "web_server_sg" {
  name        = "web_server_sg"

[03/01, 7:06 pm] Meta AI: Here are a few improved versions:

1. "In this modified code, similar to the previous example, the depends_on attribute in the Frontend resource block has been commented out to test whether it still creates the same number of Frontend instances as Backend instances."
2. "To verify the dependency, the depends_on attribute in the Frontend resource block has been commented out in this code, which is similar to the previous example. This test checks if the number of Frontend instances created still matches the number of Backend instances."
3. "This code, similar to the above example, has the depends_on attribute in the Frontend resource block commented out. This modification allows us to observe whether the number of Frontend instances created remains equal to the number of Backend instances."
[04/01, 11:18 am] Deepak Ranjan Mishra: Improve the sentence  - How to watch downloaded youtube videos in laptop when off line
[04/01, 11:18 am] Meta AI: Here are a few improved versions:

1. "How to play downloaded YouTube videos on your laptop offline."
2. "Watching downloaded YouTube videos on your laptop without an internet connection: A step-by-step guide."
3. "How to view downloaded YouTube videos offline on your laptop."

These revised sentences are more concise, clear, and grammatically correct, making them easier to understand.
[04/01, 11:50 am] Deepak Ranjan Mishra: verify the error and give a solution - │ Error: Error launching source instance: InvalidParameterValue: Invalid availability zone: [us-east-2a]
│       status code: 400, request id: f30a62ed-ab8c-4bd6-b664-919c31a9f7cb
│ 
│   with aws_instance.Backend-East-2[0],
│   on ec2.tf line 69, in resource "aws_instance" "Backend-East-2":
│   69: resource "aws_instance" "Backend-East-2" {
│ 
╵
╷
│ Error: Error launching source instance: InvalidParameterValue: Invalid availability zone: [us-east-2b]
│       status code: 400, request id: 8ed4aabc-ced6-4c4b-8120-ccba1bba5bd5
│ 
│   with aws_instance.Backend-East-2[1],
│   on ec2.tf line 69, in resource "aws_instance" "Backend-East-2":
│   69: resource "aws_instance" "Backend-East-2" {
│ 
╵
[04/01, 11:50 am] Meta AI: The error message indicates that the availability zones (AZs) specified in the aws_instance resource are invalid.

Specifically, the error messages mention:

- us-east-2a is an invalid availability zone.
- us-east-2b is an invalid availability zone.

The solution is to update the availability_zone attribute in the aws_instance resource to use valid AZs for the us-east-2 region.

Here's an example of how to fix the issue:


hcl
resource "aws_instance" "Backend-East-2" {
  // ...
  availability_zone = "us-east-2a" -> Update this to a valid AZ, e.g., "us-east-2c"
  // ...
}


You can check the available AZs for the us-east-2 region using the AWS CLI command:


bash
aws ec2 describe-availability-zones --region us-east-2


This command will output a list of available AZs for the region, which you can then use to update the availability_zone attribute in your Terraform configuration.
[04/01, 12:07 pm] Deepak Ranjan Mishra: modify the command so that it will show only the ZoneNames - aws ec2 describe-availability-zones --region us-east-2
[04/01, 12:07 pm] Meta AI: You can modify the command to show only the ZoneNames by using the --query option:


bash
aws ec2 describe-availability-zones --region us-east-2 --query 'AvailabilityZones[*].ZoneName'


This command will output a list of ZoneNames for the us-east-2 region, such as:


[
  "us-east-2a",
  "us-east-2b",
  "us-east-2c"
]


If you want to remove the brackets and quotes, you can add the --output text option:


bash
aws ec2 describe-availability-zones --region us-east-2 --query 'AvailabilityZones[*].ZoneName' --output text


This will output:


us-east-2a
us-east-2b
us-east-2c

[04/01, 12:13 pm] Deepak Ranjan Mishra: Error: Error launching source instance: InvalidParameterValue: Invalid availability zone: [us-east-2a]
│   status code: 400, request id: 88eb9af3-de9c-4108-8654-d3f7c44a9069
│ 
│   with aws_instance.Backend-East-2[1],
│   on ec2.tf line 69, in resource "aws_instance" "Backend-East-2":
│   69: resource "aws_instance" "Backend-East-2" {
[04/01, 12:13 pm] Meta AI: The error message indicates that the availability zone us-east-2a is invalid.

Here are a few possible solutions:

1. Check the availability zone: Make sure that us-east-2a is a valid availability zone in the us-east-2 region. You can check the available zones using the AWS CLI command:


bash
aws ec2 describe-availability-zones --region us-east-2 --query 'AvailabilityZones[*].ZoneName' --output text


1. Update the availability zone: If us-east-2a is not a valid zone, update the availability_zone attribute in the aws_instance resource to use a valid zone.


hcl
resource "aws_instance" "Backend-East-2" {
  // ...
  availability_zone = "us-east-2c" // Update to a valid zone
  // ...
}


1. Use a zone that is not hardcoded: Instead of hardcoding the availability zone, you can use the aws_availability_zones data source to get a list of available zones and then select one randomly.


hcl
data "aws_availability_zones" "available" {
  state = "available"
}

resource "aws_instance" "Backend-East-2" {
  // ...
  availability_zone = data.aws_availability_zones.available.names[0]
  // ...
}

[04/01, 12:17 pm] Deepak Ranjan Mishra: Error: Error launching source instance: InvalidParameterValue: Invalid availability zone: [us-east-2c]
│   status code: 400, request id: 73d3fad3-532b-4b42-967f-329a872e287d
│ 
│   with aws_instance.Backend-East-2[1],
│   on ec2.tf line 69, in resource "aws_instance" "Backend-East-2":
│   69: resource "aws_instance" "Backend-East-2" {
│ 
╵
╷
│ Error: Error launching source instance: InvalidParameterValue: Invalid availability zone: [us-east-2b]
│   status code: 400, request id: f29a0217-40de-4224-a8ba-ba648976f33a
│ 
│   with aws_instance.Backend-East-2[0],
│   on ec2.tf line 69, in resource "aws_instance" "Backend-East-2":
│   69: resource "aws_instance" "Backend-East-2" {
│
[04/01, 12:17 pm] Meta AI: It seems like none of the availability zones (us-east-2a, us-east-2b, us-east-2c) are valid for your AWS account.

Here are a few possible reasons for this issue:

1. Availability zones not enabled: Make sure that the availability zones you're trying to use are enabled for your AWS account.
2. Region not supported: Verify that the us-east-2 region supports the instance type you're trying to launch.
3. Account restrictions: Check if there are any account-level restrictions or limitations on the availability zones you can use.

To resolve this issue:

1. Check the AWS Management Console: Log in to the AWS Management Console and navigate to the EC2 dashboard. Check if the availability zones you're trying to use are listed and enabled.
2. Use the AWS CLI: Run the following command to describe the availability zones in the us-east-2 region:


bash
aws ec2 describe-availability-zones --region us-east-2


This command will output a list of availability zones that are available in the us-east-2 region.
1. Update your Terraform configuration: Once you've identified the available availability zones, update your Terraform configuration to use one of the valid zones.

For example:


hcl
resource "aws_instance" "Backend-East-2" {
  // ...
  availability_zone = "us-east-2d" // Update to a valid zone
  // ...
}

[04/01, 12:19 pm] Deepak Ranjan Mishra: is it possible that the ami of north virginia and ohio are diierent so the error
[04/01, 12:19 pm] Meta AI: Yes, it's possible that the AMI (Amazon Machine Image) IDs for North Virginia (us-east-1) and Ohio (us-east-2) are different, which could cause the error.

AMI IDs are region-specific, and AWS provides different AMI IDs for different regions. When you launch an EC2 instance, you need to specify the AMI ID that is available in the region you're launching the instance in.

If you're using the same AMI ID for both North Virginia and Ohio regions, it might not work because the AMI ID is not valid for the Ohio region.

To resolve this issue, you can:

1. Check the AMI ID: Verify that the AMI ID you're using is valid for the Ohio region (us-east-2). You can check the AWS Management Console or use the AWS CLI to describe the available AMI IDs for the region.
2. Use a region-specific AMI ID: Update your Terraform configuration to use a region-specific AMI ID for the Ohio region. You can use the aws_ami data source to get the latest AMI ID for the region.
3. Use a generic AMI ID: If you're using a generic AMI ID that is not region-specific, you can update your Terraform configuration to use a more specific AMI ID that is valid for both regions.

For example:

hcl
data "aws_ami" "example" {
  most_recent = true
  owners       = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_instance" "example" {
  ami           = (link unavailable)
  instance_type = "t2.micro"
}

In this example, the aws_ami data source is used to get the latest AMI ID for the region, and then the ami attribute of the aws_instance resource is updated to use the region-specific AMI ID.
[05/01, 12:17 am] Deepak Ranjan Mishra: Create a check list before applying the code
[05/01, 12:22 pm] Meta AI: Here's a checklist to consider before applying the code:

Pre-Deployment Checklist
AWS Configuration
1. Verify AWS credentials: Ensure your AWS access keys are valid and have the necessary permissions.
2. Confirm AWS region: Double-check that you're using the correct AWS region (e.g., us-east-2).
3. Check AWS service limits: Ensure you're within the service limits for the resources you're creating (e.g., EC2 instances, security groups).

Terraform Configuration
1. Review Terraform version: Verify you're using a compatible version of Terraform.
2. Check Terraform syntax: Validate the Terraform configuration files for syntax errors.
3. Verify resource configurations: Double-check the configurations for each resource (e.g., EC2 instances, security groups).

Security and Networking
1. Verify security group rules: Ensure the security group rules are correct and allow the necessary traffic.
2. Check network configuration: Validate the network configuration, including subnets, route tables, and NACLs.
3. Confirm IAM roles and policies: Verify that the IAM roles and policies are correctly configured.

Code Quality and Testing
1. Code review: Perform a code review to ensure the configuration is correct and follows best practices.
2. Test the configuration: Test the Terraform configuration in a non-production environment before applying it to production.
3. Verify monitoring and logging: Ensure monitoring and logging are correctly configured to detect any issues.

Change Management
1. Create a backup: Create a backup of the existing infrastructure configuration before making changes.
2. Document changes: Document the changes made to the Terraform configuration.
3. Notify stakeholders: Notify stakeholders of the upcoming changes and provide a timeline for the deployment.

**Date: - 6.1.2024**

**Practice**

 **Source : Meta AI**

```
Q) solve the following error -  Error: creating EC2 Instance: operation error EC2: RunInstances, https response error StatusCode: 400, RequestID: 9863f180-f58a-4c93-b205-2c4521b31f96, api error InvalidAMIID.NotFound: The image id '[ami-00eb69d236edcfaf8]' does not exist
│ 
│   with aws_instance.Backend-East-2[1],
│   on ec2.tf line 68, in resource "aws_instance" "Backend-East-2":
│   68: resource "aws_instance" "Backend-East-2" {
│

Sol : The error message indicates that the specified AMI ID (ami-00eb69d236edcfaf8) does not exist. This can happen if the AMI ID is incorrect, outdated, or not available in the region you're trying to launch the instance in.

To solve this error, you can try the following:

1. Verify the AMI ID: Double-check that the AMI ID is correct and valid. You can check the AWS Management Console or use the AWS CLI to verify the AMI ID.
2. Check the region: Ensure that the AMI ID is available in the region you're trying to launch the instance in. You can check the AWS Management Console or use the AWS CLI to verify the available AMI IDs in the region.
3. Use a different AMI ID: If the AMI ID is incorrect or outdated, try using a different AMI ID that is valid and available in the region.
4. *Use the aws_ami data source*: Instead of hardcoding the AMI ID, you can use the aws_ami data source to retrieve the latest AMI ID for the region.

Here's an example of how to use the aws_ami data source:

```
data "aws_ami" "example" {
  most_recent = true
  owners       = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_instance" "Backend-East-2" {
  ami           = (link unavailable)
  instance_type = "t2.micro"
}
```

In this example, the aws_ami data source is used to retrieve the latest AMI ID for the region, and then the ami attribute of the aws_instance resource is set to the retrieved AMI ID.
[06/01, 12:44 pm] Deepak Ranjan Mishra: is the code correct
[06/01, 12:44 pm] Meta AI: The code snippet you provided earlier is mostly correct, but I did notice a small issue:


```
data "aws_ami" "example" {
  most_recent = true
  owners       = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_instance" "Backend-East-2" {
  ami           = (link unavailable)
  instance_type = "t2.micro"
}
```

The issue is with the line ami = (link unavailable). This is not a valid way to reference the AMI ID retrieved by the aws_ami data source.

To fix this, you should replace that line with:



ami = (link unavailable)


This will correctly reference the AMI ID retrieved by the aws_ami data source.

Here's the corrected code snippet:


```
data "aws_ami" "example" {
  most_recent = true
  owners       = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_instance" "Backend-East-2" {
  ami           = (link unavailable)
  instance_type = "t2.micro"
}
```


This line references the id attribute of the aws_ami data source, which contains the AMI ID.


```
provider "aws" {                      

region  = "us-east-1"
}

provider "aws" {                     

region  = "us-east-2"

alias   = "us-east-2"
}
# Variable Block

variable "zones_east-1" {                                             #  Zone-1    :  N.Virginia               

  default = ["us-east-1a", "us-east-1b"]

}



variable "zones_east-2" {                                             #  Zone-2    :  Ohio

  default = ["us-east-2a", "us-east-2b"]

}





# Resource Block in  US-east-1 - N.Virginia



resource "aws_instance" "Backend-East-1" {

  ami           = "ami-0e2c8caa4b6378d8c"      # AMI : Ubuntu Server 24.04 LTS (HVM),EBS General Purpose (SSD) Volume Type

  instance_type = "t2.micro"

  availability_zone = var.zones_east-1[count.index]

  count         = 2



  lifecycle {

    prevent_destroy = false

  }



  tags = {

    Name = "Backend-East-1-${count.index + 1}"      # Also we can name it as "Backend_N.Virginia-${count.index + 1}" or Baknd_N.Virginia               

    Team = "DevOps"

  }

}



resource "aws_instance" "Frontend-East-1" {

  ami           = "ami-0e2c8caa4b6378d8c"        # AMI : Ubuntu Server 24.04 LTS (HVM),EBS General Purpose (SSD) Volume Type

  instance_type = "t2.micro"

  availability_zone = var.zones_east-1[count.index]



  count         = length(aws_instance.Backend-East-1)



  depends_on = [aws_instance.Backend-East-1]



  lifecycle {

    create_before_destroy = true

  }



  tags = {

    Name = "Frontend-East-1-${count.index + 1}"

    Team = "DevOps"

  }

}



# Resource Block in  US-east-2 - Ohio





data "aws_ami" "ubuntu" {

  most_recent = true



  owners = ["amazon"]

  filter {

    name   = "name"

    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]

      }

}



resource "aws_instance" "Backend-East-2" {

  ami           = data.aws_ami.ubuntu.id    # data.aws_ami.example.id

 instance_type = "t2.micro"

  availability_zone = var.zones_east-2[count.index]



  count         = 2



  lifecycle {

    prevent_destroy = false

  }



  tags = {

    Name = "Backend-East-2-${count.index + 1}"     # "Backend_Ohio-${count.index + 1}"

    Team = "DevOps"

  }

}



resource "aws_instance" "Frontend-East-2" {

  ami           = data.aws_ami.ubuntu.id

  instance_type = "t2.micro"

   availability_zone = var.zones_east-2[count.index]



  count         = length(aws_instance.Backend-East-2)



  depends_on = [aws_instance.Backend-East-2]



  lifecycle {

    create_before_destroy = true

  }



  tags = {

    Name = "Frontend-East-2-${count.index + 1}"

    Team = "DevOps"

  }

}
```

and following is the error - Error: creating EC2 Instance: operation error EC2: RunInstances, https response error StatusCode: 400, RequestID: a7d56cb4-6ca1-4142-9012-6fc0b6a34a57, api error InvalidParameterValue: Invalid availability zone: [us-east-2a]

│ 

│   with aws_instance.Backend-East-2[0],

│   on ec2.tf line 76, in resource "aws_instance" "Backend-East-2":

│   76: resource "aws_instance" "Backend-East-2" {

│ Rectify the error
[06/01, 1:02 pm] Meta AI: The error message indicates that the availability zone us-east-2a is invalid.

To rectify the error, you need to update the zones_east-2 variable to use valid availability zones for the us-east-2 region.

Here's the corrected code:


variable "zones_east-2" {
  default = ["us-east-2b", "us-east-2c"]
}


Alternatively, you can use the aws_availability_zones data source to get a list of available availability zones for the us-east-2 region:


data "aws_availability_zones" "available" {
  state = "available"
  filter {
    name   = "region-name"
    values = ["us-east-2"]
  }
}

variable "zones_east-2" {
  default = data.aws_availability_zones.available.names
}


By using the aws_availability_zones data source, you can ensure that you're using valid availability zones for the us-east-2 region.
[06/01, 1:08 pm] Deepak Ranjan Mishra: Error: Variables not allowed
│ 
│   on ec2.tf line 30, in variable "zones_east-2":
│   30:   default = data.aws_availability_zones.available.names
│ 
│ Variables may not be used here.
[06/01, 1:08 pm] Meta AI: The error message indicates that variables cannot be used to set the default value of another variable.

To fix this, you can use the data.aws_availability_zones.available.names expression directly in the availability_zone attribute of the aws_instance resource:


resource "aws_instance" "Backend-East-2" {
  ami           = (link unavailable)
  instance_type = "t2.micro"
  availability_zone = data.aws_availability_zones.available.names[count.index]
  count         = 2

  lifecycle {
    prevent_destroy = false
  }

  tags = {
    Name = "Backend-East-2-${count.index + 1}"
    Team = "DevOps"
  }
}


This way, you're using the data.aws_availability_zones.available.names expression directly in the availability_zone attribute, rather than trying to set it as the default value of a variable.
[06/01, 1:18 pm] Deepak Ranjan Mishra: │ Error: Invalid index
│ 
│   on ec2.tf line 38, in resource "aws_instance" "Backend-East-1":
│   38:   availability_zone =  data.aws_availability_zones.available.names[count.index]
│     ├────────────────
│     │ count.index is 0
│     │ data.aws_availability_zones.available.names is empty list of string
│ 
│ The given key does not identify an element in this collection value: the collection has no elements.
╵
╷
│ Error: Invalid index
│ 
│   on ec2.tf line 86, in resource "aws_instance" "Backend-East-2":
│   86:   availability_zone = data.aws_availability_zones.available.names[count.index]
│     ├────────────────
│     │ count.index is 0
│     │ data.aws_availability_zones.available.names is empty list of string
│ 
│ The given key does not identify an element in this collection value: the collection has no elements.
[06/01, 1:18 pm] Meta AI: The error message indicates that the data.aws_availability_zones.available.names list is empty, and you're trying to access an element at index 0 using count.index.

To fix this, you need to ensure that the data.aws_availability_zones.available.names list is populated before trying to access its elements.

Here are a few possible solutions:

1. Check the AWS region: Ensure that the AWS region you're using has availability zones. If the region doesn't have availability zones, the data.aws_availability_zones.available.names list will be empty.
2. Use a depends_on statement: Add a depends_on statement to the aws_instance resource to ensure that the data.aws_availability_zones.available.names list is populated before trying to access its elements.

Here's an example:


data "aws_availability_zones" "available" {
  state = "available"
}

resource "aws_instance" "Backend-East-1" {
  // ...
  depends_on = [data.aws_availability_zones.available]
  availability_zone = data.aws_availability_zones.available.names[count.index]
  // ...
}


1. Use a conditional statement: Use a conditional statement to check if the data.aws_availability_zones.available.names list is empty before trying to access its elements.

Here's an example:


data "aws_availability_zones" "available" {
  state = "available"
}

resource "aws_instance" "Backend-East-1" {
  // ...
  availability_zone = length(data.aws_availability_zones.available.names) > 0 ? data.aws_availability_zones.available.names[count.index] : "us-east-1a"
  // ...
}

[06/01, 1:25 pm] Deepak Ranjan Mishra: Error: Attribute redefined
│ 
│   on ec2.tf line 112, in resource "aws_instance" "Frontend-East-2":
│  112:   depends_on = [aws_instance.Backend-East-2]
│ 
│ The argument "depends_on" was already set at ec2.tf:105,2-12. Each argument may be set only once.
[06/01, 1:25 pm] Meta AI: The error message indicates that the depends_on argument is being redefined for the aws_instance "Frontend-East-2" resource.

To fix this, you can remove the duplicate depends_on argument. Since you're already depending on aws_instance.Backend-East-2 at line 105, you can remove the depends_on argument at line 112.

Here's the corrected code:

resource "aws_instance" "Frontend-East-2" {
ami           = (link unavailable)
instance_type = "t2.micro"
availability_zone = length(data.aws_availability_zones.available.names) > 0 ? data.aws_availability_zones.available.names[count.index] : "us-east-2a"
count         = length(aws_instance.Backend-East-2)

lifecycle {
create_before_destroy = true
}

tags = {
Name = "Frontend-East-2-${count.index + 1}"
Team = "DevOps"
}
}
[06/01, 1:31 pm] Deepak Ranjan Mishra: │ Error: Invalid index
│ 
│   on ec2.tf line 38, in resource "aws_instance" "Backend-East-1":
│   38:   availability_zone = data.aws_availability_zones.available.names[count.index]
│     ├────────────────
│     │ count.index is 0
│     │ data.aws_availability_zones.available.names is empty list of string
│ 
│ The given key does not identify an element in this collection value: the collection has no elements.
╵
╷
│ Error: Invalid index
│ 
│   on ec2.tf line 88, in resource "aws_instance" "Backend-East-2":
│   88:   availability_zone = data.aws_availability_zones.available.names[count.index]
│     ├────────────────
│     │ count.index is 0
│     │ data.aws_availability_zones.available.names is empty list of string
│ 
│ The given key does not identify an element in this collection value: the collection has no elements.
╵
root@ip-172-31-26-33:/home/ubuntu/prac#
[06/01, 1:31 pm] Meta AI: The error message indicates that the data.aws_availability_zones.available.names list is empty, and you're trying to access an element at index 0 using count.index.

To fix this, you can add a conditional statement to check if the data.aws_availability_zones.available.names list is empty before trying to access its elements.

Here's an updated code snippet:


resource "aws_instance" "Backend-East-1" {
  // ...
  count = 2

  availability_zone = length(data.aws_availability_zones.available.names) > 0 ? data.aws_availability_zones.available.names[count.index % length(data.aws_availability_zones.available.names)] : var.zones_east-1[count.index % length(var.zones_east-1)]
  // ...
}

resource "aws_instance" "Backend-East-2" {
  // ...
  count = 2

  availability_zone = length(data.aws_availability_zones.available.names) > 0 ? data.aws_availability_zones.available.names[count.index % length(data.aws_availability_zones.available.names)] : var.zones_east-2[count.index % length(var.zones_east-2)]
  // ...
}


In this updated code, we're using the modulo operator (%) to cycle through the available availability zones if the data.aws_availability_zones.available.names list is empty.

We're also using the length() function to get the length of the data.aws_availability_zones.available.names list and the var.zones_east-1/var.zones_east-2 lists.

This should fix the error and allow you to deploy your infrastructure.
[06/01, 1:56 pm] Deepak Ranjan Mishra: modify the code
[06/01, 1:56 pm] Meta AI: Here is the modified code:


provider "aws" {
  region = "us-east-1"
}

provider "aws" {
  region  = "us-east-2"
  alias   = "us-east-2"
}

Variable Block
variable "zones_east-1" {
  default = ["us-east-1a", "us-east-1b"]
}

variable "zones_east-2" {
  default = ["us-east-2a", "us-east-2b"]
}

Resource Block in US-east-1 - N.Virginia
resource "aws_instance" "Backend-East-1" {
  ami           = "ami-0e2c8caa4b6378d8c"
  instance_type = "t2.micro"
  count         = 2

  availability_zone = var.zones_east-1[count.index]

  lifecycle {
    prevent_destroy = false
  }

  tags = {
    Name = "Backend-East-1-${count.index + 1}"
    Team = "DevOps"
  }
}

resource "aws_instance" "Frontend-East-1" {
  ami           = "ami-0e2c8caa4b6378d8c"
  instance_type = "t2.micro"
  count         = length(aws_instance.Backend-East-1)

  availability_zone = var.zones_east-1[count.index]

  depends_on = [aws_instance.Backend-East-1]

  lifecycle {
    create_before_destroy = true
  }

  tags = {
    Name = "Frontend-East-1-${count.index + 1}"
    Team = "DevOps"
  }
}

Resource Block in US-east-2 - Ohio
data "aws_availability_zones" "available" {
  provider = aws.us-east-2
  state     = "available"
}

resource "aws_instance" "Backend-East-2" {
  provider        = aws.us-east-2
  ami              = "ami-0e2c8caa4b6378d8c"
  instance_type    = "t2.micro"
  count            = 2

  availability_zone = length(data.aws_availability_zones.available.names) > 0 ? data.aws_availability_zones.available.names[count.index] : var.zones_east-2[count.index]

  lifecycle {
    prevent_destroy = false
  }

  tags = {
    Name = "Backend-East-2-${count.index + 1}"
    Team = "DevOps"
  }
}

resource "aws_instance" "Frontend-East-2" {
  provider        = aws.us-east-2
  ami              = "ami-0e2c8caa4b6378d8c"
  instance_type    = "t2.micro"
  count            = length(aws_instance.Backend-East-2)

  availability_zone = length(data.aws_availability_zones.available.names) > 0 ? data.aws_availability_zones.available.names[count.index] : var.zones_east-2[count.index]

  depends_on = [aws_instance.Backend-East-2]

  lifecycle {
    create_before_destroy = true
  }

  tags = {
    Name = "Frontend-East-2-${count.index + 1}"
    Team = "DevOps"
  }
}


I made the following changes:

- Added the provider attribute to the aws_instance resources in the us-east-2 region to specify the provider alias.
- Updated the availability_zone attribute in the Backend-East-2 and Frontend-East-2 resources to use the length() function to check if the data.aws_availability_zones.available.names list is empty.
- Updated the depends_on attribute in the Frontend-East-2 resource to reference the Backend-East-2 resource.
[06/01, 1:59 pm] Deepak Ranjan Mishra: modify the code -provider "aws" {                     
region  = "us-east-2"
alias   = "us-east-2"
}
[06/01, 1:59 pm] Meta AI: Here is the modified code:

provider "aws" {
region = "us-east-1"
}

provider "aws" {
region  = "us-east-2"
alias   = "east2"
}

Variable Block
variable "zones_east-1" {
default = ["us-east-1a", "us-east-1b"]
}

variable "zones_east-2" {
default = ["us-east-2a", "us-east-2b"]
}

Resource Block in US-east-1 - N.Virginia
resource "aws_instance" "Backend-East-1" {
ami           = "ami-0e2c8caa4b6378d8c"
instance_type = "t2.micro"
count         = 2

availability_zone = var.zones_east-1[count.index]

lifecycle {
prevent_destroy = false
}

tags = {
Name = "Backend-East-1-${count.index + 1}"
Team = "DevOps"
}
}

resource "aws_instance" "Frontend-East-1" {
ami           = "ami-0e2c8caa4b6378d8c"
instance_type = "t2.micro"
count         = length(aws_instance.Backend-East-1)

availability_zone = var.zones_east-1[count.index]

depends_on = [aws_instance.Backend-East-1]

lifecycle {
create_before_destroy = true
}

tags = {
Name = "Frontend-East-1-${count.index + 1}"
Team = "DevOps"
}
}

Resource Block in US-east-2 - Ohio
data "aws_availability_zones" "available" {
provider = aws.east2
state     = "available"
}

resource "aws_instance" "Backend-East-2" {
provider        = aws.east2
ami              = "ami-0e2c8caa4b6378d8c"
instance_type    = "t2.micro"
count            = 2

availability_zone = length(data.aws_availability_zones.available.names) > 0 ? data.aws_availability_zones.available.names[count.index] : var.zones_east-2[count.index]

lifecycle {
prevent_destroy = false
}

tags = {
Name = "Backend-East-2-${count.index + 1}"
Team = "DevOps"
}
}

resource "aws_instance" "Frontend-East-2" {
provider        = aws.east2
ami              = "ami-0e2c8caa4b6378d8c"
instance_type    = "t2.micro"
count            = length(aws_instance.Backend-East-2)

availability_zone = length(data.aws_availability_zones.available.names) > 0 ? data.aws_availability_zones.available.names[count.index] : var.zones_east-2[count.index]

depends_on = [aws_instance.Backend-East-2]

lifecycle {
create_before_destroy = true
}

tags = {
Name = "Frontend-East-2-${count.index + 1}"
Team = "DevOps"
}
}



**Date : - 7.1.2025**

**Source : Meta AI**


When you define a provider block without specifying an alias, it becomes the default provider for the region.

In your case, the first provider block is:

provider "aws" {
  region = "us-east-1"
}

This becomes the default provider for the us-east-1 region.

When you define a resource block without specifying a provider, it will use the default provider for the region. In this case, the Resource Block in US-east-1 - N.Virginia is using the default provider, which is the first provider block.

So, even though you didn't explicitly specify the provider for the Resource Block in US-east-1 - N.Virginia, it's automatically using the default provider for the us-east-1 region.

However, for the Resource Block in US-east-2 - Ohio, you explicitly specified the provider as aws.east2, which is the second provider block. This tells Terraform to use the us-east-2 region for those resources.
```


**Format of the Code**

#### The code format is mostly correct, but here are some minor improvements for better readability and consistency:

```
# Code-1 - NEW - Version - 1 - Ami hardcoded

# Provider Blocks
provider "aws" {
  region = "us-east-1"
}

provider "aws" {
  region  = "us-east-2"
  alias   = "east2"
}

# Variable Blocks
variable "zones_east-1" {
  # Zone-1 : N.Virginia
  default = ["us-east-1a", "us-east-1b"]
}

variable "zones_east-2" {
  default = ["us-east-2a", "us-east-2b"]
}

# Resource Blocks
# US-east-1 - N.Virginia
resource "aws_instance" "Backend-East-1" {
  # Backend Resource Block - N.Virginia
  ami           = "ami-0e2c8caa4b6378d8c"
  instance_type = "t2.micro"
  availability_zone = var.zones_east-1[count.index]
  count         = 2

  lifecycle {
    prevent_destroy = false
  }

  tags = {
    Name = "Backend-East-1-${count.index + 1}"
    Team = "DevOps"
  }
}

resource "aws_instance" "Frontend-East-1" {
  ami           = "ami-0e2c8caa4b6378d8c"
  instance_type = "t2.micro"
  availability_zone = var.zones_east-1[count.index]
  count         = length(aws_instance.Backend-East-1)

  depends_on = [aws_instance.Backend-East-1]

  lifecycle {
    create_before_destroy = true
  }

  tags = {
    Name = "Frontend-East-1-${count.index + 1}"
    Team = "DevOps"
  }
}

# US-east-2 - Ohio
resource "aws_instance" "Backend-East-2" {
  provider        = aws.east2
  ami              = "ami-00eb69d236edcfaf8"
  instance_type    = "t2.micro"
  availability_zone = var.zones_east-2[count.index]
  count            = 2

  lifecycle {
    prevent_destroy = false
  }

  tags = {
    Name = "Backend-East-2-${count.index + 1}"
    Team = "DevOps"
  }
}

resource "aws_instance" "Frontend-East-2" {
  provider        = aws.east2
  ami              = "ami-00eb69d236edcfaf8"
  instance_type    = "t2.micro"
  availability_zone = var.zones_east-2[count.index]
  count            = length(aws_instance.Backend-East-2)

  depends_on = [aws_instance.Backend-East-2]

  lifecycle {
    create_before_destroy = true
  }

  tags = {
    Name = "Frontend-East-2-${count.index + 1}"
    Team = "DevOps"
  }
}
```

Changes made:

- Added blank lines to separate logical blocks of code
- Standardized indentation and spacing
- Renamed some comments for clarity
- Removed unnecessary comments


**How to write the Code for Presenation Purpose**

The format is clean and well-organized, making it easy to understand for most audiences. However, for presentation purposes, you may want to consider a few additional improvements:

1. Add a header or title: Include a clear title that describes the purpose of the code, such as "AWS Infrastructure as Code (IaC) Example".
2. Use clear and concise comments: While your comments are good, consider making them more descriptive and concise. This will help others quickly understand the purpose of each section.
3. Consider using a more visual format: For presentation purposes, you may want to use a format that makes the code more visually appealing, such as using different colors or fonts for comments, headers, and code.
4. Break up long lines: Some lines of code are quite long. Consider breaking them up into multiple lines for better readability.
5. Use consistent naming conventions: Your variable and resource names are clear, but consider using a consistent naming convention throughout the code.

Here's an updated version incorporating these suggestions:

```
# AWS Infrastructure as Code (IaC) Example

# Provider Blocks
provider "aws" {
  region = "us-east-1"
}

provider "aws" {
  region  = "us-east-2"
  alias   = "east2"
}

# Variable Blocks
variable "zones_east-1" {
  # Availability zones for US East 1 (N. Virginia)
  default = ["us-east-1a", "us-east-1b"]
}

variable "zones_east-2" {
  # Availability zones for US East 2 (Ohio)
  default = ["us-east-2a", "us-east-2b"]
}

# Resource Blocks
# US East 1 (N. Virginia)
resource "aws_instance" "Backend-East-1" {
  # Backend instance in US East 1
  ami           = "ami-0e2c8caa4b6378d8c"
  instance_type = "t2.micro"
  availability_zone = var.zones_east-1[count.index]
  count         = 2

  lifecycle {
    prevent_destroy = false
  }

  tags = {
    Name = "Backend-East-1-${count.index + 1}"
    Team = "DevOps"
  }
}

 ... (rest of the code remains the same)
```
