**Practice-1**


```
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

**Practice-2**

```
resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"

  ingress {
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["11.22.33.44/32"]
  }

  ingress {
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["11.22.33.44/32"]
  }

  ingress {
    from_port        = 8080
    to_port          = 8080
    protocol         = "tcp"
    cidr_blocks      = ["11.22.33.44/32"]
  }

  ingress {
    from_port        = 9090
    to_port          = 9090
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

Error: Incorrect attribute value type
│ 
│   on main.tf line 8, in resource "aws_security_group" "allow_tls":
│    8:     cidr_blocks      = "11.22.33.44/32"
│ 
│ Inappropriate value for attribute "cidr_blocks": list of string required.
╵
╷
│ Error: Incorrect attribute value type
│ 
│   on main.tf line 15, in resource "aws_security_group" "allow_tls":
│   15:     cidr_blocks      = "11.22.33.44/32"
│ 
│ Inappropriate value for attribute "cidr_blocks": list of string required.
╵
╷
│ Error: Incorrect attribute value type
│ 
│   on main.tf line 22, in resource "aws_security_group" "allow_tls":
│   22:     cidr_blocks      = "11.22.33.44/32"
│ 
│ Inappropriate value for attribute "cidr_blocks": list of string required.
╵
╷
│ Error: Incorrect attribute value type
│ 
│   on main.tf line 29, in resource "aws_security_group" "allow_tls":
│   29:     cidr_blocks      = "11.22.33.44/32"
│ 
│ Inappropriate value for attribute "cidr_blocks": list of string required.


**Solution:**

The following isthe right syntax to write the code :

 cidr_blocks      = ["11.22.33.44/32]"  , use the brackets.
