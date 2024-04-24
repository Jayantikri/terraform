# first creating vpc
resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "main"
  }
}
#internet gateway to access directly from public subnets 
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "igw"
  }
}
# create subnets 
resource "aws_subnet" "private-ap-south-1a" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.0.0/19"
  availability_zone = "ap-south-1a"

  tags = {
    "Name"                                      = "private-ap-south-1a"
    
  }
}

resource "aws_subnet" "private-ap-south-1b" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.32.0/19"
  availability_zone = "ap-south-1b"

  tags = {
    "Name"                                      = "private-ap-south-1b"
    
  }
}

resource "aws_subnet" "public-ap-south-1a" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.64.0/19"
  availability_zone       = "ap-south-1a"
  map_public_ip_on_launch = true

  tags = {
    "Name"                                      = "public-ap-south-1a"
    
  }
}

resource "aws_subnet" "public-ap-south-1b" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.96.0/19"
  availability_zone       = "ap-south-1b"
  map_public_ip_on_launch = true

  tags = {
    "Name"           = "public-ap-south-1b"
  }
}
# nat gateway eip
resource "aws_eip" "nat" {


  tags = {
    Name = "nat"
  }
}

resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public_ap_south_1a.id

  tags = {
    Name = "nat"
  }

  depends_on = [aws_internet_gateway.igw]
}
#create route table
resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat.id
  }

  tags = {
    Name = "private"
  }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "public"
  }
}

resource "aws_route_table_association" "private_ap_south_1a" {
  subnet_id      = aws_subnet.private_ap_south_1a.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "private_ap_south_1b" {
  subnet_id      = aws_subnet.private_ap_south_1b.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "public_ap_south_1a" {
  subnet_id      = aws_subnet.public_ap_south_1a.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public_ap_south_1b" {
  subnet_id      = aws_subnet.public_ap_south_1b.id
  route_table_id = aws_route_table.public.id
}


   
# load balancer
resource "aws_lb" "my_lb" {
  name               = "my-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.my_sg.id]

  subnets = [
    aws_subnet.public_ap_south_1a.id,
    aws_subnet.public_ap_south_1b.id
  ]
}



