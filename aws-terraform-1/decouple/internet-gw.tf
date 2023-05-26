## Create an Inetrnet gateway

resource "aws_internet_gateway" "gateway" {
  vpc_id = aws_vpc.prod-vpc.id

  tags = {
    Name = "Prod-internet-gw"
  }
}
