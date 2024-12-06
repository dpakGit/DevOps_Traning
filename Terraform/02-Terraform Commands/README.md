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

Q.   How to execute the command to display output with line numbers. - terraform state list

Sol. You can use the following command to display the Terraform state list with line numbers:

Command:-  **terraform state list | nl**

The nl command is used to add line numbers to the output.



#### Explain the command : history |cut  -c 8-


Let's break down the command:

history: This command displays a list of previously executed commands in the terminal.

|: This is a pipe symbol, which takes the output of the previous command (history) and passes it as input to the next command.

cut: This command is used to extract a specific portion of text from the input.

-c 8-: This option specifies that cut should extract characters starting from the 8th position to the end of the line.

So, when you run the command history | cut -c 8-, it displays the list of previously executed commands, but without the first 7 characters (which typically include the command number and some whitespace).
     

