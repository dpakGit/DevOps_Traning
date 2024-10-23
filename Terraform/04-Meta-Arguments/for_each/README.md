## The for_each Meta-Argument
1. https://developer.hashicorp.com/terraform/language/meta-arguments/for_each#when-to-use-for_each-instead-of-count

The for_each meta-argument accepts a map or a set of strings, and creates an instance for each item in that map or set. Each resource has a distinct infrastructure object associated with it, and each is separately created, updated, or destroyed when the configuration is applied.


2. https://developer.hashicorp.com/terraform/language/meta-arguments/for_each