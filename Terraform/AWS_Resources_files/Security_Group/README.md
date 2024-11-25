1. ![Screenshot (190)](https://github.com/user-attachments/assets/b9ca8de2-0c33-46bc-b672-c2a94efe8498)

2. ![Screenshot (189)](https://github.com/user-attachments/assets/941162ae-dd73-4db9-9fdd-75bc4d6b9d7d)

3. ![Screenshot (191)](https://github.com/user-attachments/assets/0572ced6-99be-4809-84bd-28fda25c2350)

4. Managing AWS Security Groups Through Terraform: https://spacelift.io/blog/terraform-security-group








Date : 23.11.2024

#### Explanation of various blocks and attributes of a Terraform `Security_Group` code.

Source : Meta AI

Q.  What is following code block of terraform known as -

resource "aws_security_group" "allow_tls" {
 name        = "allow_tls"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.main.id

  tags = {
    Name = "allow_tls"
  }
}


Ans:


 This block of Terraform code is known as a **Resource Declaration** or a **Resource Definition**.

More specifically, it's an AWS Security Group Resource declaration, as it defines an AWS Security Group resource.

In Terraform, this block is composed of:

1. resource: The keyword indicating the start of a resource declaration.
2. "aws_security_group": The type of resource being declared (in this case, an AWS Security Group).
3. "allow_tls": The name given to this resource instance.
4. { ... }: The resource properties, which define the characteristics of the resource.

This Resource Declaration is used to create and manage an AWS Security Group with the specified properties.



More elaborate explanation :

Here's a breakdown of the Terraform code:

##### Resource Definition

resource "aws_security_group" "allow_tls" {

- resource: Keyword to define a new resource.
- aws_security_group: Type of resource, in this case, an AWS Security Group.
- allow_tls: Name of the resource, used to reference it elsewhere in the Terraform configuration.

##### Security Group Properties

name = "allow_tls"

- name: Attribute to set the name of the Security Group.

description = "Allow TLS inbound traffic and all outbound traffic"

- description: Attribute to set a description for the Security Group.

vpc_id = (link unavailable)

- vpc_id: Attribute to specify the ID of the VPC where the Security Group will be created.
- (link unavailable): References the id attribute of an aws_vpc resource named main, which is assumed to be defined elsewhere in the Terraform configuration.

##### Tags

tags = { Name = "allow_tls" }

- tags: Attribute to set tags for the Security Group.
- Name = "allow_tls": Sets a tag with key Name and value allow_tls.

**Summary**

This Terraform code defines an AWS Security Group named allow_tls in a VPC referenced by aws_vpc.main. The Security Group has a description and a tag. However, this code does not define any ingress or egress rules for the Security Group. Those would need to be added separately using the ingress and egress blocks.

**Practice:**

**Date: -** 25.112024

```
root@ip-172-31-19-195:/home/labsuser/practice# terraform state list
aws_security_group.allow_tls
root@ip-172-31-19-195:/home/labsuser/practice# cat main.tf 
resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"

  ingress {
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
 cidr_blocks      = ["11.22.33.44/32"]
    
  }

  

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_tls"
  }
}

```


**AWS Console output:**

![Uploading Screenshot (254).png…]()

