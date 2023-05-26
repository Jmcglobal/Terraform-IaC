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
