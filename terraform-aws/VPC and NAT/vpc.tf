# Criação da VPC
resource "aws_vpc" "main-vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
}

# Criação das Subnets
resource "aws_subnet" "main-public-1" {
  vpc_id                  = aws_vpc.main-vpc.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "eu-west-1a"
  map_public_ip_on_launch = true

  tags = {
    "Subnet-Name" = "main-public-1"
  }
}

resource "aws_subnet" "main-private-1" {
  vpc_id            = aws_vpc.main-vpc.id
  cidr_block        = "10.0.4.0/24"
  availability_zone = "eu-west-1a"

  tags = {
    "Subnet-Name" = "main-private-1"
  }
}

resource "aws_subnet" "main-public-2" {
  vpc_id                  = aws_vpc.main-vpc.id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = "eu-west-1b"
  map_public_ip_on_launch = true

  tags = {
    "Subnet-Name" = "main-public-2"
  }
}

resource "aws_subnet" "main-private-2" {
  vpc_id            = aws_vpc.main-vpc.id
  cidr_block        = "10.0.5.0/24"
  availability_zone = "eu-west-1b"

  tags = {
    "Subnet-Name" = "main-private-2"
  }
}

resource "aws_subnet" "main-public-3" {
  vpc_id                  = aws_vpc.main-vpc.id
  cidr_block              = "10.0.3.0/24"
  availability_zone       = "eu-west-1c"
  map_public_ip_on_launch = true

  tags = {
    "Subnet-Name" = "main-public-3"
  }
}

resource "aws_subnet" "main-private-3" {
  vpc_id            = aws_vpc.main-vpc.id
  cidr_block        = "10.0.6.0/24"
  availability_zone = "eu-west-1c"

  tags = {
    "Subnet-Name" = "main-private-3"
  }
}

# Intenet Gateway - Saída para Internet
resource "aws_internet_gateway" "main-gw" {
  vpc_id = aws_vpc.main-vpc.id

  tags = {
    "Name" = "gw-main"
  }
}

# Rota Padrão - 0.0.0.0/0 saíndo pelo Gateway
resource "aws_route_table" "main-public" {
  vpc_id = aws_vpc.main-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main-gw.id
  }

  tags = {
    "Route-Name" = "default-route"
  }
}

# Associando rota padrão criada às sub-redes públicas
resource "aws_route_table_association" "main-public-1-route-association" {
  subnet_id      = aws_subnet.main-public-1.id
  route_table_id = aws_route_table.main-public.id
}

resource "aws_route_table_association" "main-public-2-route-association" {
  subnet_id      = aws_subnet.main-public-2.id
  route_table_id = aws_route_table.main-public.id
}

resource "aws_route_table_association" "main-public-3-route-association" {
  subnet_id      = aws_subnet.main-public-3.id
  route_table_id = aws_route_table.main-public.id
}
