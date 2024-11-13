https://awstip.com/automating-infrastructure-management-terraform-intro-c31573a80614 :- see this link and try to describe the commands in the same way
     
     alias t=terraform
    
     terraform init 
     
     terraform plan

     terraform plan -out "file_name"    # this is the file name to which you want to save the plan
     
     
     Terraform apply -auto-approve     # Automatic Plan Mode-
     https://developer.hashicorp.com/terraform/cli/commands/apply#automatic-plan-mode
     
     terraform apply
    
     cat terraform.tfstate 
    
     terraform show
     Command: state list : https://developer.hashicorp.com/terraform/cli/commands/state/list
     terraform state list
      
     vim main.tf 
     
     terraform validate 
    
     
     terraform destroy
