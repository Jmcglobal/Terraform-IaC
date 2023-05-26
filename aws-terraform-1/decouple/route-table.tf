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

## Private subnet Association to route-table

resource "aws_route_table_association" "prod-private-2a" {
  subnet_id         = aws_subnet.prod-private-2a.id
  route_table_id    = aws_route_table.prod-private-rt.id
}

resource "aws_route_table_association" "pro-private-2b" {
    subnet_id       = aws_subnet.prod-private-2b.id
    route_table_id  = aws_route_table.prod-private-rt.id

}
