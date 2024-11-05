### Output data from Terraform:


Read the following page  in the below link completely:-

https://developer.hashicorp.com/terraform/tutorials/configuration-language/outputs#query-outputs

Output VPC and load balancer information

**outputs.tf**

How to write a output block

```
output "lb_url" {
  description = "URL of load balancer"
  value       = "http://${module.elb_http.elb_dns_name}/"
}

output "web_server_count" {
  description = "Number of web servers provisioned"
  value       = length(module.ec2_instances.instance_ids)
}

```

#### Redact sensitive outputs

Example:- 
#### sensitive = true

```
outputs.tf

output "db_username" {
  description = "Database administrator username"
  value       = aws_db_instance.database.username
  **sensitive**   = true
}

output "db_password" {
  description = "Database administrator password"
  value       = aws_db_instance.database.password
  sensitive   = true
}

```

#### Query outputs



