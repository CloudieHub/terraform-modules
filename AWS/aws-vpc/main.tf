resource "aws_vpc" "this" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags                 = merge(var.tags, { Name = "cloudiehub-vpc" })
}

# Internet gateway
resource "aws_internet_gateway" "this" {
  vpc_id = aws_vpc.this.id
  tags   = merge(var.tags, { Name = "cloudiehub-igw" })
}

# Public subnets
resource "aws_subnet" "public" {
  for_each = { for idx, cidr in var.public_subnet_cidrs : idx => cidr }
  vpc_id                  = aws_vpc.this.id
  cidr_block              = each.value
  map_public_ip_on_launch = true
  availability_zone       = data.aws_availability_zones.available.names[each.key]
  tags                    = merge(var.tags, { Name = "cloudiehub-public-${each.key}" })
}

# Private subnets
resource "aws_subnet" "private" {
  for_each = { for idx, cidr in var.private_subnet_cidrs : idx => cidr }
  vpc_id            = aws_vpc.this.id
  cidr_block        = each.value
  availability_zone = data.aws_availability_zones.available.names[each.key]
  tags              = merge(var.tags, { Name = "cloudiehub-private-${each.key}" })
}

# Public route table & associations
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.this.id
  tags   = merge(var.tags, { Name = "cloudiehub-public-rt" })
}

resource "aws_route" "public_internet" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.this.id
}

resource "aws_route_table_association" "public_assoc" {
  for_each       = aws_subnet.public
  subnet_id      = each.value.id
  route_table_id = aws_route_table.public.id
}

# NAT Gateways (optional) and Elastic IPs
data "aws_availability_zones" "available" {}

resource "aws_eip" "nat" {
  count = var.enable_nat_gateway ? length(aws_subnet.public) : 0
  vpc   = true
  tags  = merge(var.tags, { Name = "cloudiehub-nat-eip-${count.index}" })
}

resource "aws_nat_gateway" "nat" {
  count         = var.enable_nat_gateway ? length(aws_subnet.public) : 0
  allocation_id = aws_eip.nat[count.index].id
  subnet_id     = element(values(aws_subnet.public).*id, count.index)
  tags          = merge(var.tags, { Name = "cloudiehub-nat-${count.index}" })
}

# Private route tables with NAT
resource "aws_route_table" "private" {
  for_each = aws_subnet.private
  vpc_id   = aws_vpc.this.id
  tags     = merge(var.tags, { Name = "cloudiehub-private-rt-${each.key}" })
}

resource "aws_route" "private_to_nat" {
  for_each               = aws_route_table.private
  route_table_id         = each.value.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = null
  nat_gateway_id         = var.enable_nat_gateway ? element(aws_nat_gateway.nat.*.id, tonumber(each.key)) : null
  depends_on             = [aws_nat_gateway.nat]
  lifecycle {
    ignore_changes = [nat_gateway_id]
  }
}

resource "aws_route_table_association" "private_assoc" {
  for_each       = aws_subnet.private
  subnet_id      = each.value.id
  route_table_id = aws_route_table.private[each.key].id
}

# Security group example (allow internal traffic & SSH to bastion)
resource "aws_security_group" "bastion" {
  name   = "cloudiehub-bastion-sg"
  vpc_id = aws_vpc.this.id
  tags   = merge(var.tags, { Name = "cloudiehub-bastion-sg" })

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "SSH - restrict this in production"
  }

  ingress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    security_groups = []
    description     = "Allow internal traffic (customize)"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

