resource "aws_vpc" "myvpc" {
 cidr_block = "10.0.0.0/16"

 tags = {
   Name = "myvpc"
 }
}

resource "aws_internet_gateway" "mygateway" {
  vpc_id = "${aws_vpc.myvpc.id}"
}
#Creating subnets
resource "aws_subnet" "mysubnet1" {
  vpc_id     = aws_vpc.myvpc.id
  cidr_block = "10.0.1.0/24"
  map_public_ip_on_launch = true 
  availability_zone = "ap-south-1a"

  tags = {
    Name = "mysubnet1"
  }
}
resource "aws_subnet" "mysubnet2" {
  vpc_id     = aws_vpc.myvpc.id
  cidr_block = "10.0.2.0/24"
  map_public_ip_on_launch = true 
  availability_zone = "ap-south-1b"

  tags = {
    Name = "mysubnet2"
  }
}

