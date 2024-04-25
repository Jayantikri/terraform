provider "aws" {
    access_key = var.access_key
    secret_key = var.secret_key
    region = var.mumbai
  
}

resource "aws_instance" "ec1" {
    ami = "ami-007020fd9c84e18c7"
    instance_type = "t2.micro"
    key_name = "sql"
    tags = {
      Name = "ec1 ${count.index}"
    }
    count = 2
  
}

variable "mumbai" {
  type = string
  default = "ap-south-1"
  description = "This is mumbai region"
}
