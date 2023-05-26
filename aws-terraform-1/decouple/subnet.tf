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
