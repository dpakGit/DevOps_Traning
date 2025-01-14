#### timestamp Function

This is a Terraform built-in function that returns the current timestamp in RFC 3339 format (e.g., "2022-01-01T12:00:00Z"). The timestamp is generated when the Terraform configuration is applied.

```
locals {
  default = timestamp()
}

resource "example_resource" "example" {
  # ...
  tags = {
    CreatedAt = local.default
  }
}
```
By using this local variable, you can easily reference the current timestamp throughout your Terraform configuration.
