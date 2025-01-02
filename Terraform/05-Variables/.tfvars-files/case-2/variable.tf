# Declare variables

variable "image_id" {
 type = string
 # default = "ami-0866a3c8686eaeeba"   # Ubuntu Server 24.04 LTS (HVM),EBS General Purpose (SSD) Volume Type.
}


variable "zones" { 
 type = list(string)
 default = ["us-east-1a", "us-east-1b"]
}


variable "myname" {
 type = string
 default = "mydefault-instances"
}
