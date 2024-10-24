## The for_each Meta-Argument
1. https://developer.hashicorp.com/terraform/language/meta-arguments/for_each#when-to-use-for_each-instead-of-count

The for_each meta-argument accepts a map or a set of strings, and creates an instance for each item in that map or set. Each resource has a distinct infrastructure object associated with it, and each is separately created, updated, or destroyed when the configuration is applied.


2. https://developer.hashicorp.com/terraform/language/meta-arguments/for_each

3. **KODEKLOUD** : - https://kodekloud.com/blog/terraform-for_each/  { Imp }

4. Terraform Count vs. For Each Meta-Argument -spacelift – When to Use It :
    https://spacelift.io/blog/terraform-count-for-each

# What is the difference between a count and for loop on a resource object in Terraform and why might you use them?


What is the difference between a count and for loop on a resource object in Terraform and why might you use them?

**count** – This looping construct creates a fixed number of resources based on a count value.

**for_each** – This looping construct allows you to create multiple instances of a resource based on a set of input values, such as a list or map.
