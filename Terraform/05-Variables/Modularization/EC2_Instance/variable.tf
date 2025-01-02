# 1. Variable: - "ZONES"

variable "zones" {
  type = list(string)
  default = ["us-east-1a", "us-east-1b"]
}

# 2. Variable: - "Names"

variable "myname" {
  type = string
  default = "mydefault-instances"
}

# 3. Variable: - "CIDR Range"

#variable cidr {
   # default = "11.11.11.11/32"
#}
