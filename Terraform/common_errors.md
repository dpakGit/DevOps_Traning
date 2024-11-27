1. **Error: No configuration files**
 
 Apply requires configuration to be present. Applying without a configuration would mark everything for destruction, which is normally not what is desired. If you would
 like to destroy everything, run 'terraform destroy' instead.

 solution: This error means that you have run the command in the wrong place. You have to be in the directory that contains your configuration files, so before running init or apply you have to cd to your Terraform project folder.
