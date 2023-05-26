### Create Elastic Ip for nat gateway

resource "aws_eip" "nat_eip" {
  vpc = true
  depends_on = [ aws_internet_gateway.gateway ]

  tags = {
    Name = "Nat-gateway"
  }
}
