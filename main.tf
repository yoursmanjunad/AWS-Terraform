resource "aws_vpc" "payment_vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = {
    Name = "Dev"
  }
}
resource "aws_subnet" "payment_subnet" {
  vpc_id                  = aws_vpc.payment_vpc.id
  cidr_block              = "10.0.0.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "ap-south-1a"
  tags = {
    Name = "Dev"
  }
}

resource "aws_internet_gateway" "payment_ig" {
  vpc_id = aws_vpc.payment_vpc.id
  tags = {
    Name = "Dev-IGW-Payment"
  }
}
resource "aws_route_table" "payment-rt" {
  vpc_id = aws_vpc.payment_vpc.id

  tags = {
    Name = "payment-rt"
  }
}
resource "aws_route" "default_route" {
  route_table_id         = aws_route_table.payment-rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.payment_ig.id
}
resource "aws_route_table_association" "payment-rt-a" {
  subnet_id      = aws_subnet.payment_subnet.id
  route_table_id = aws_route_table.payment-rt.id
}

resource "aws_security_group" "payment-sg" {

}
