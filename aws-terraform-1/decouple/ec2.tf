## Create Ec2 instance on public subnet

resource "aws_instance" "publicInstance-a" {
  ami = "ami-024e6efaf93d85776"
  instance_type = "t2.micro"
  vpc_security_group_ids = [ aws_security_group.public.id ]
  subnet_id = aws_subnet.prod-public-2a.id
  key_name = "Ohio"
#   count = 1
  associate_public_ip_address = true

  tags = {
    Name = "Instance-a"
  }
}

resource "aws_instance" "publicInstance-b" {
  ami = "ami-024e6efaf93d85776"
  instance_type = "t2.micro"
  vpc_security_group_ids = [ aws_security_group.public.id ]
  subnet_id = aws_subnet.prod-public-2b.id
  key_name = "Ohio"
#   count = 1
  associate_public_ip_address = true

  tags = {
    Name = "Instance-b"
  }
}

### Create Instance on private subnet

resource "aws_instance" "privateInstance-a" {
  ami = "ami-024e6efaf93d85776"
  instance_type = "t2.micro"
  vpc_security_group_ids = [ aws_security_group.private.id ]
  subnet_id = aws_subnet.prod-private-2a.id
  key_name = "Ohio"
#   count = 1
  associate_public_ip_address = false

  tags = {
    Name = "Private-a"
  }
}

resource "aws_instance" "privateInstance-b" {
  ami = "ami-024e6efaf93d85776"
  instance_type = "t2.micro"
  vpc_security_group_ids = [ aws_security_group.private.id]
  subnet_id = aws_subnet.prod-private-2b.id
  key_name = "Ohio"
#   count = 1
  associate_public_ip_address = false

  tags = {
    Name = "Private-b"
  }
}