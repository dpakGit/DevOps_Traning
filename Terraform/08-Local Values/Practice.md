**Date: - 16.12.2024**

**Code-1**

Source: Devopspro

```

locals {
  common_tags = {
    Team = "DevOps"
    Purpose = "Monitoring-App"
  }
}

resource "aws_instance" "dev" {
  ami           = "ami-005fc0f236362e99f"
  instance_type = "t2.nano"
  # tags = {
  #   Team = "DevOps"
  #   Purpose = "Monitoring-App"
  # }
  tags = local.common_tags
}

resource "aws_instance" "prod" {
  ami           = "ami-005fc0f236362e99f"
  instance_type = "t2.medium"
  # tags = {
  #   Team = "DevOps"
  #   Purpose = "Monitoring-App"
  # } 
  tags = local.common_tags
}

resource "aws_ebs_volume" "volume" {
  availability_zone = "us-east-1a"
  size              = 40
  # tags = {
  #   Team = "DevOps"
  #   Purpose = "Monitoring-App"
  # }
  tags = local.common_tags
}
```

**Code-2**

Source: Meta AI

```

locals {
  common_tags = {
    Team    = "DevOps"
    Purpose = "Monitoring-App"
    Name    = "monitoring-app"

  }
}

resource "aws_instance" "dev" {
  ami           = "ami-005fc0f236362e99f"
  instance_type = "t2.nano"
  # tags = {
  #   Team = "DevOps"
  #   Purpose = "Monitoring-App"
  # }
  tags = local.common_tags
}

resource "aws_instance" "prod" {
  ami           = "ami-005fc0f236362e99f"
  instance_type = "t2.medium"
  # tags = {
  #   Team = "DevOps"
  #   Purpose = "Monitoring-App"
  # } 
  tags = local.common_tags
}

resource "aws_ebs_volume" "volume" {
  availability_zone = "us-east-1a"
  size              = 40
  # tags = {
  #   Team = "DevOps"
  #   Purpose = "Monitoring-App"
  # }
  tags = local.common_tags
}
```

**Code-3**

Source: Meta AI

In this updated code, I added a resource_names local variable that stores separate names for each resource. 
I then used the merge function to combine the common_tags with the resource-specific name.

```
locals {
  common_tags = {
    Team    = "DevOps"
    Purpose = "Monitoring-App"
  }
  resource_names = {
    dev_instance  = "dev-monitoring-app"
    prod_instance = "prod-monitoring-app"
    ebs_volume     = "monitoring-app-data"
  }
}

resource "aws_instance" "dev" {
  ami           = "ami-005fc0f236362e99f"
  instance_type = "t2.nano"
  tags = merge(local.common_tags, {
    Name = local.resource_names.dev_instance
  })
}

resource "aws_instance" "prod" {
  ami           = "ami-005fc0f236362e99f"
  instance_type = "t2.medium"
  tags = merge(local.common_tags, {
    Name = local.resource_names.prod_instance
  })
}

resource "aws_ebs_volume" "volume" {
  availability_zone = "us-east-1a"
  size               = 40
  tags = merge(local.common_tags, {
    Name = local.resource_names.ebs_volume
  })
}
```

Practice - 4

Having a separate local.tf file.

 ls | nl
     1  ec2.tf
     2  **local.tf**
     3  provider.tf
     4  terraform.tfstate
     5  terraform.tfstate.backup

