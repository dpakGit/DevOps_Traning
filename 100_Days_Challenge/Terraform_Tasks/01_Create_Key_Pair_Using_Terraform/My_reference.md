### Steps and Commands to Create Key Pair with Terraform
Steps to Accomplish the Task
1. Navigate to Terraform working directory:

bash
cd /home/bob/terraform

- Where to run: In the terminal opened in VS Code (via right-click > Open in Integrated Terminal).

2. Create main.tf file:
- Create a file named main.tf in /home/bob/terraform with the Terraform configuration I provided earlier:

hcl
provider "aws" {
  region = "us-east-1" # Change to your desired AWS region
}

resource "aws_key_pair" "devops_kp" {
  key_name   = "devops-kp"
  key_type   = "rsa"
  public_key = tls_private_key.devops_kp.public_key_openssh
}

resource "tls_private_key" "devops_kp" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "local_file" "devops_kp_pem" {
  content         = tls_private_key.devops_kp.private_key_pem
  filename        = "/home/bob/devops-kp.pem"
  file_permission = "0600"
}


3. Initialize Terraform:

bash
terraform init

- Where to run: In /home/bob/terraform directory in the terminal.

4. Apply Terraform configuration:

bash
terraform apply

- Where to run: In /home/bob/terraform directory in the terminal.
- Action: Confirm the apply when prompted (type yes).

Outcome
- *Key pair devops-kp created in AWS*.
- Private key saved to /home/bob/devops-kp.pem.

Do you need help with:
- Troubleshooting Terraform or AWS setup?
- Using the created key pair in AWS?
- Something else related to Terraform or AWS?


### Terraform Command for Formatting and Checking Indentation
- *Use terraform fmt* to format Terraform configuration files (.tf files) for proper indentation and style consistency.

bash
terraform fmt

- Where to run: In the directory containing your Terraform files (e.g., /home/bob/terraform).

Notes
- Automatic formatting: terraform fmt rewrites files in the working directory to have consistent indentation and formatting.
- Checks and applies formatting: Run this before terraform validate or terraform apply for best practices.

Do you need help with:
- Validating Terraform configurations?
- Other Terraform commands or usage?
- Something else related to Terraform?

