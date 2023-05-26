## Create a public security group

resource "aws_security_group" "private" {
  description   = "Allow limited inbound connection"
  vpc_id        = aws_vpc.prod-vpc.id
  name          = "terraform_ec2_public_sg"

  ingress {
    protocol = "tcp"
    cidr_blocks = [ "172.16.0.0/16" ]
    from_port = 22
    to_port = 22
  }

  ingress {
    protocol = "tcp"
    cidr_blocks = [ "172.16.0.0/16" ]
    from_port = 80
    to_port = 80
  }

  ingress {
    protocol = "tcp"
    cidr_blocks = [ "172.16.0.0/16" ]
    from_port = 443
    to_port = 443    
  }

  egress {
    protocol = -1
    cidr_blocks = [ "0.0.0.0/0" ]
    from_port = 0
    to_port = 0
  }

  tags = {
    Name = "Private-Access"
  }
}

## Create a Security for private subnet

resource "aws_security_group" "public" {
  description   = "Allow inbound connection"
  vpc_id        = aws_vpc.prod-vpc.id
  name          = "terraform_ec2_private_sg"

  ingress {
    protocol = "tcp"
    cidr_blocks = [ "0.0.0.0/0" ]
    from_port = 22
    to_port = 22
  }

  ingress {
    protocol = "tcp"
    cidr_blocks = [ "0.0.0.0/0" ]
    from_port = 80
    to_port = 80
  }

  ingress {
    protocol = "tcp"
    cidr_blocks = [ "0.0.0.0/0" ]
    from_port = 443
    to_port = 443    
  }

  egress {
    protocol = -1
    cidr_blocks = [ "0.0.0.0/0" ]
    from_port = 0
    to_port = 0
  }

  tags = {
    Name = "Public-Web-Access"
  }
}