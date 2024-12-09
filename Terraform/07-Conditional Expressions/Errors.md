**Date: - 0.12.2024**

1. **Error: Inconsistent dependency lock file**
│ 
│ The following dependency selections recorded in the lock file are inconsistent with the current configuration:
│   - provider registry.terraform.io/hashicorp/aws: required by this configuration but no version is selected
│ 
│ To make the initial dependency selections that will initialize the dependency lock file, run:

Sol: The above error occred as i have not run the "terraform init" command.

2. terraform destroy -auto-approve
   
 **Error message: open terraform.tfstate: permission denied**
│ 
│ Terraform acquires a state lock to protect the state from being written
│ by multiple users at the same time. Please resolve the issue above and try
│ again. For most commands, you can disable locking with the "-lock=false"
│ flag, but this is not recommended.
╵
ubuntu@ip-172-31-89-7:~/ce$ terraform destroy -auto-approve
╷
│ Error: Error acquiring the state lock
│ 
│ Error message: open terraform.tfstate: permission denied
│ 
│ Terraform acquires a state lock to protect the state from being written
│ by multiple users at the same time. Please resolve the issue above and try
│ again. For most commands, you can disable locking with the "-lock=false"
│ flag, but this is not recommended.


Sol: Second error was because i was not a root user.
