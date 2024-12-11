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

**Date: 11.12.2024**

root@ip-172-31-18-189:/home/ubuntu# terraform apply -auto-approve
var.is_dev_env
  Enter a value: true  # the input was true
  

**Error:** creating EC2 Instance: operation error EC2: RunInstances, https response error StatusCode: 403, RequestID: 0b71b12c-673c-4842-b5ac-6a5a8f872439, api error UnauthorizedOperation: You are not authorized to perform this operation. User: arn:aws:iam::246839783311:user/terraform is not authorized to perform: ec2:RunInstances on resource: arn:aws:ec2:us-east-1:246839783311:instance/* with an explicit deny in a service control policy. Encoded authorization failure message: i0EBKFcNtzJY3NLdDHhY-TRoknr0hmUAFWZiLnGZ3RpWSpsVYWMu5GINkYeBh9c4ZXaT2Cl3kdsdjOx5QHd2kYpj3es-3tGgF3E8uMk-PxCTzvO-aemeY8qeD5NRiv1yYbrOEl7mTLBSDTYpOl6kCvPwqYwdqEsACFFM5zw1RDmcq_8FZ0gDbz7OrljA3fGq_F-WguNbY7R7DVaMO45QEGRYyV_OetZEZr-jFzDNLpnT37NdLPcavuYWak4Zp1Wrb-1vg-bk1cMBDPQ8ryqu7I-ZVOpPmYUVBu8i-obSSkzPfW3LtpVLDAFaJDQXw0jWEn26LlYRE4p-RLZLDbgycuvlGntSMUzgkNf6-siJWJSCvJwfT1g5EZnD9amETuGKG9Mguz3I7h8LMQGBxGBdMSRRU3TdscM-5wdjy6ZmjWnlIeO_cXAyrfoBVEr8i2mS52pkjtdpE2Dn2W4yicv0EMob7X-9pEIqPTmstyR4BOr6o-fB4nsYCZgK1Em8MZPbIugTGZc6SkjQ7RCy5_2r4i_Yc-xSLVjENjfnWyNp1Dz5LcQ6SJtlUnn7xuzegqbpyfmOt4E08qZMF3Y3OdwuiqaE1T0pn-rTpz_f54aw0sTY0bvYiyqB96X4AsnrSQOD7bPDBwztm-aX8iE35w6hJSNEtuRcdZXq-xgoznRtGDb0zIyHK8hmf0ft8ONxT1AI62OC2Ue6nWNDOPd1lxAsXEqKEsLbmRyvNYD0XTILrNoL87cMRLRq7gtMdKSLsdV8I5HltkUtudns3DP5rE_8sAYld2aNFfO-H30lamNMo0CbpkpKK-lR9dWPdGD1-zLiHiVnpkuMk30PyfuHQlKd5WyX3RQyTmU2nXPUhGxQQL2yE6CAhDze8cnPToUJwbqwLeOMYCC-wapBKLeW9nTGeu5ipLlebpPbUVzl3aRBfbFtXkTJ6kWSyw
│ 
│   with aws_instance.prod,
│   on code-1.tf line 18, in resource "aws_instance" "prod":
│   18: resource "aws_instance" "prod" {
│ 

Sol:

While running terraform plan i encountered this error and out of the two ec2 instances only dev instance was created and not prod because instance type was "instance_type = "t2.large"" which is not allowed in my account

**Meta AI:** 

Here's a concise version of the error message:

Error:

- Operation: EC2: RunInstances
- Error: UnauthorizedOperation
- Message: You are not authorized to perform this operation.
- Reason: Explicit deny in a service control policy.
- User: arn:aws:iam::246839783311:user/terraform

This error indicates that the Terraform user doesn't have the necessary permissions to create an EC2 instance. To resolve this issue, you'll need to update the IAM policy to grant the required permissions.

