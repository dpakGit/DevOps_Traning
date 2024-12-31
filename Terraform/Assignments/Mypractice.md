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

Reffered Youtube video link : https://www.youtube.com/watch?v=KHVmt22OXCU 

Created a VPC with cidr block as 10.0.0.0/16.
applied the terraform apply command and created the resource.
changed or modified the cidr block from 10.0.0.0/16 to 20.0.0.0/16, and the applied the apply command , it first created the modified instance and then deleted the old one .

root@ip-172-31-31-194:/home/ubuntu/first# t apply -auto-approve

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


