## VPC and required Components according to resource need
### Create a VPC

resource "aws_vpc" "prod-vpc" {
  cidr_block = "172.16.0.0/16"
  instance_tenancy = "default"
  enable_dns_support = "true"
  enable_dns_hostnames = "true"

  tags = {
    Name = "prod-vpc"
  }
}

## Create an Inetrnet gateway

resource "aws_internet_gateway" "gateway" {
  vpc_id = aws_vpc.prod-vpc.id

  tags = {
    Name = "Prod-internet-gw"
  }
}

### Create Elastic Ip for nat gateway

resource "aws_eip" "nat_eip" {
  vpc = true
  depends_on = [ aws_internet_gateway.gateway ]

  tags = {
    Name = "Nat-gateway"
  }
}

## Create a Nat Gateway

resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id = aws_subnet.prod-public-2a.id

  tags = {
    Name = "Nat-Gateway"
  }
}

## Create public Subnets-2a and 2b

resource "aws_subnet" "prod-public-2a" {
  vpc_id = aws_vpc.prod-vpc.id
  cidr_block = "172.16.1.0/24"
  map_public_ip_on_launch = "true"
  availability_zone = "us-east-2a"

  tags = {
    Name = "prod-public-2a"
  }

}

resource "aws_subnet" "prod-public-2b" {
  vpc_id = aws_vpc.prod-vpc.id
  cidr_block = "172.16.2.0/24"
  map_public_ip_on_launch = "true"
  availability_zone = "us-east-2b"

  tags = {
    Name = "prod-public-2b"
  }
}

### Create private subnet 2a and  2b

resource "aws_subnet" "prod-private-2a" {
  vpc_id = aws_vpc.prod-vpc.id
  cidr_block = "172.16.10.0/24"
  map_public_ip_on_launch = "false"
  availability_zone = "us-east-2a"

  tags = {
    Name = "prod-private-2a"
  }
}

resource "aws_subnet" "prod-private-2b" {
  vpc_id = aws_vpc.prod-vpc.id
  cidr_block = "172.16.20.0/24"
  map_public_ip_on_launch = "false"
  availability_zone = "us-east-2b"

  tags = {
    Name = "prod-private-2b"
  }
}

## Create a public Route table

resource "aws_route_table" "prod-rt" {
  vpc_id = aws_vpc.prod-vpc.id

  route  {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gateway.id
  }

  tags = {
    Name = "prod-pub-rt"
  }
}

## Subnet Association for public-2a and 2b

resource "aws_route_table_association" "prod-pub-2a" {
  subnet_id = aws_subnet.prod-public-2a.id
  route_table_id = aws_route_table.prod-rt.id
}

## ## Subnet Association subnet-2

resource "aws_route_table_association" "prod-pub-2b" {
  subnet_id = aws_subnet.prod-public-2b.id
  route_table_id = aws_route_table.prod-rt.id
}


## Create Private route table

resource "aws_route_table" "prod-private-rt" {
  vpc_id = aws_vpc.prod-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat.id
  }

  tags    = {
    Name  = "prod-private-rt"
  }
}

resource "aws_route_table_association" "prod-private-2a" {
  subnet_id         = aws_subnet.prod-private-2a.id
  route_table_id    = aws_route_table.prod-private-rt.id
}

resource "aws_route_table_association" "pro-private-2b" {
    subnet_id       = aws_subnet.prod-private-2b.id
    route_table_id  = aws_route_table.prod-private-rt.id

}

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