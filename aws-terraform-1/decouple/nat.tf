## Create a Nat Gateway

resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id = aws_subnet.prod-public-2a.id

  tags = {
    Name = "Nat-Gateway"
  }
}