#### Recovering Deleted TFState File

https://www.reddit.com/r/Terraform/comments/1fryxlc/recovering_deleted_tfstate_file_from_s3/?rdt=44940


#### What i did when the  file was deleted:

1. Removed the file : rm -rf terraform.tfstate

2.   ls

3. Applied the terraform plan command 

4.  ls

5. Again applied the terraform apply -auto-approve command
