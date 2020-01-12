data "aws_availability_zones" "available" {}

# VPC Setup
resource "aws_vpc" "main" {
  cidr_block           = var.VPC_CIDR_BLOCK
  instance_tenancy     = "default"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  enable_classiclink   = "false"
  tags = {
    Name = "main"
  }
}

# VPC Subnets
resource "aws_subnet" "main-public-1" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.VPC_PUBLIC_SUBNET1_CIDR_BLOCK
  map_public_ip_on_launch = "true"
  availability_zone       = data.aws_availability_zones.available.names[0]
  tags = {
    Name = "main-public-1"
  }
}

resource "aws_subnet" "main-public-2" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.VPC_PUBLIC_SUBNET2_CIDR_BLOCK
  map_public_ip_on_launch = "true"
  availability_zone       = data.aws_availability_zones.available.names[1]
  tags = {
    Name = "main-public-2"
  }
}

resource "aws_subnet" "main-public-3" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.VPC_PUBLIC_SUBNET3_CIDR_BLOCK
  map_public_ip_on_launch = "true"
  availability_zone       = data.aws_availability_zones.available.names[2]
  tags = {
    Name = "main-public-3"
  }
}

resource "aws_subnet" "main-private-1" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.VPC_PRIVATE_SUBNET1_CIDR_BLOCK
  map_public_ip_on_launch = "false"
  availability_zone       = data.aws_availability_zones.available.names[0]
  tags = {
    Name = "main-private-1"
  }
}

resource "aws_subnet" "main-private-2" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.VPC_PRIVATE_SUBNET2_CIDR_BLOCK
  map_public_ip_on_launch = "false"
  availability_zone       = data.aws_availability_zones.available.names[1]
  tags = {
    Name = "main-private-2"
  }
}

resource "aws_subnet" "main-private-3" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.VPC_PRIVATE_SUBNET3_CIDR_BLOCK
  map_public_ip_on_launch = "false"
  availability_zone       = data.aws_availability_zones.available.names[2]
  tags = {
    Name = "main-private-3"
  }
}

# Internet GW
resource "aws_internet_gateway" "main-gw" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "main"
  }
}

# Route Table for Public
resource "aws_route_table" "main-public" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main-gw.id
  }
  tags = {
    Name = "main-public-rt"
  }
}

# Route Associations public
resource "aws_route_table_association" "main-public-1-a" {
  subnet_id      = aws_subnet.main-public-1.id
  route_table_id = aws_route_table.main-public.id
}
resource "aws_route_table_association" "main-public-2-a" {
  subnet_id      = aws_subnet.main-public-2.id
  route_table_id = aws_route_table.main-public.id
}
resource "aws_route_table_association" "main-public-3-a" {
  subnet_id      = aws_subnet.main-public-3.id
  route_table_id = aws_route_table.main-public.id
}

# NAT GW
resource "aws_eip" "nat" {
  vpc = true
}
resource "aws_nat_gateway" "nat-gw" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.main-public-1.id
  depends_on    = [aws_internet_gateway.main-gw]
  tags = {
    Name = "rackspace-nat-gw"
  }
}

# Route Table setup for Private through NAT
resource "aws_route_table" "main-private" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat-gw.id
  }

  tags = {
    Name = "main-private-rt"
  }
}

# Route Associations private
resource "aws_route_table_association" "main-private-1-a" {
  subnet_id      = aws_subnet.main-private-1.id
  route_table_id = aws_route_table.main-private.id
}
resource "aws_route_table_association" "main-private-2-a" {
  subnet_id      = aws_subnet.main-private-2.id
  route_table_id = aws_route_table.main-private.id
}
resource "aws_route_table_association" "main-private-3-a" {
  subnet_id      = aws_subnet.main-private-3.id
  route_table_id = aws_route_table.main-private.id
}
