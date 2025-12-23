resource "aws_vpc" "test" {
  cidr_block = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support = true
}
resource "aws_internet_gateway" "test" {
  vpc_id = aws_vpc.test.id
}
resource "aws_subnet" "public" {
  for_each = var.public_subnets
  vpc_id = aws_vpc.test.id
  cidr_block = each.value.cidr
  availability_zone = each.value.az
  map_public_ip_on_launch = true
}
resource "aws_subnet" "private" {
  for_each = var.private_subnets
  vpc_id = aws_vpc.test.id 
  cidr_block = each.value.cidr
  availability_zone = each.value.az
  map_public_ip_on_launch = false
}
resource "aws_route_table" "public" {
  for_each = aws_subnet.public
  vpc_id = aws_vpc.test.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.test.id
  }

}
resource "aws_route_table" "private" {
  for_each = aws_subnet.private
  vpc_id = aws_vpc.test.id
}
resource "aws_route_table_association" "public" {
  for_each = aws_subnet.public
  subnet_id = each.value.id
  route_table_id = aws_route_table.public[each.key].id
}
resource "aws_route_table_association" "private" {
  for_each = aws_subnet.private
  subnet_id = each.value.id
  route_table_id = aws_route_table.private[each.key].id
}

