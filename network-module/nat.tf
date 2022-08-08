resource "aws_eip" "nat_eip" {
  count = var.is_public ? 1 : 0

  vpc = true
}

resource "aws_nat_gateway" "nat_gw" {
  count = var.is_public ? 1 : 0

  allocation_id = aws_eip.nat_eip[0].id
  subnet_id     = aws_subnet.subnet.id

  tags = {
    Name = "NAT Gateway"
  }
}