resource "aws_vpc" "base" {
  cidr_block = var.vpc_cidr

}
resource "aws_internet_gateway" "base" {
  vpc_id = aws_vpc.base.id
  tags = {
    Name = "ntire-ig"
  }
  depends_on = [aws_vpc.base]

}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.base.id
  tags = {
    Name = "ntire-private"
  }


}
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.base.id
  tags = {
    Name = "ntire-public"
  }
  route {
    cidr_block = local.anywhere
    gateway_id = aws_internet_gateway.base.id
  }
  depends_on = [aws_vpc.base, aws_internet_gateway.base]

}
resource "aws_subnet" "private" {
  count             = length(var.private_subnets)
  vpc_id            = aws_vpc.base.id
  cidr_block        = var.private_subnets[count.index].cidr_block
  availability_zone = var.private_subnets[count.index].availability_zone
  tags = {
    Name = var.private_subnets[count.index].Name
  }


}
resource "aws_route_table_association" "private" {
  count = length(var.private_subnets)

  subnet_id      = aws_subnet.private[count.index].id
  route_table_id = aws_route_table.private.id


}
resource "aws_subnet" "public" {
  count             = length(var.public_subnets)
  vpc_id            = aws_vpc.base.id
  cidr_block        = var.public_subnets[count.index].cidr_block
  availability_zone = var.public_subnets[count.index].availability_zone
  tags = {
    Name = var.public_subnets[count.index].Name
  }

}
resource "aws_route_table_association" "public" {
  count          = length(var.private_subnets)
  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public.id

}

