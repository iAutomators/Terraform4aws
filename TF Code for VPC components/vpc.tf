# Creating VPC with Public and Private subnet_id

resource "aws_vpc" "mynk" {
  cidr_block           = "10.0.0.0/16"
  instance_tenancy     = "default"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  enable_classiclink   = "false"
  tags = {
    Name = "mynk"
  }
}

# Subnets
resource "aws_subnet" "mynk-public-1" {
  vpc_id                  = aws_vpc.mynk.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "eu-west-1a"

  tags = {
    Name = "mynk-public-1"
  }
}

resource "aws_subnet" "mynk-public-2" {
  vpc_id                  = aws_vpc.mynk.id
  cidr_block              = "10.0.2.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "eu-west-1b"

  tags = {
    Name = "mynk-public-2"
  }
}

resource "aws_subnet" "mynk-public-3" {
  vpc_id                  = aws_vpc.mynk.id
  cidr_block              = "10.0.3.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "eu-west-1c"

  tags = {
    Name = "mynk-public-3"
  }
}

resource "aws_subnet" "mynk-private-1" {
  vpc_id                  = aws_vpc.mynk.id
  cidr_block              = "10.0.4.0/24"
  map_public_ip_on_launch = "false"
  availability_zone       = "eu-west-1a"

  tags = {
    Name = "mynk-private-1"
  }
}

resource "aws_subnet" "mynk-private-2" {
  vpc_id                  = aws_vpc.mynk.id
  cidr_block              = "10.0.5.0/24"
  map_public_ip_on_launch = "false"
  availability_zone       = "eu-west-1b"

  tags = {
    Name = "mynk-private-2"
  }
}

resource "aws_subnet" "mynk-private-3" {
  vpc_id                  = aws_vpc.mynk.id
  cidr_block              = "10.0.6.0/24"
  map_public_ip_on_launch = "false"
  availability_zone       = "eu-west-1c"

  tags = {
    Name = "mynk-private-3"
  }
}

# Internet GW
resource "aws_internet_gateway" "mynk-gw" {
  vpc_id = aws_vpc.mynk.id

  tags = {
    Name = "mynk"
  }
}

# route tables
resource "aws_route_table" "mynk-public" {
  vpc_id = aws_vpc.mynk.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.mynk-gw.id
  }

  tags = {
    Name = "mynk-public-1"
  }
}

# route associations public
resource "aws_route_table_association" "mynk-public-1-a" {
  subnet_id      = aws_subnet.mynk-public-1.id
  route_table_id = aws_route_table.mynk-public.id
}

resource "aws_route_table_association" "mynk-public-2-a" {
  subnet_id      = aws_subnet.mynk-public-2.id
  route_table_id = aws_route_table.mynk-public.id
}

resource "aws_route_table_association" "mynk-public-3-a" {
  subnet_id      = aws_subnet.mynk-public-3.id
  route_table_id = aws_route_table.mynk-public.id
}