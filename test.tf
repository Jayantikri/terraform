provider "aws" {
    access_key = "**********"
    secret_key = "*******"
    region = "ap-south-1"
  
}

resource "aws_instance" "ec1" {
    ami = "ami-007020fd9c84e18c7"
    instance_type = "t2.micro"
    key_name = "sql"
    tags = {
      Name = "ec1 ${count.index}" (or +count.index)
    }
    count = 2
  
}
