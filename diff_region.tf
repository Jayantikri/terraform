provider "aws" {
    access_key = var.access_key
    secret_key = var.secret_key
    region = var.mumbai
  
}
provider "aws" {
  access_key = var.access_key
  secret_key = var.secret_key
  alias = "east"
  region = "us-east-1"
  
}

resource "aws_instance" "ec1" {
    ami = "ami-007020fd9c84e18c7"
    instance_type = "t2.micro"
    key_name = "myterrakey"
    availability_zone = "ap-south-1b"
    tags = {
      Name = "ec1"
    }
    
    depends_on = [ aws_key_pair.awskey ]
    security_groups = [ "mysecurity"] #security-group name
  
}
resource "aws_instance" "ec2" {
    provider = aws.east
    ami = "ami-080e1f13689e07408"
    instance_type = "t2.micro"
    
    availability_zone =   "us-east-1a"
    tags = {
      Name = "ec2"
    }
     
}
variable "mumbai" {
  type = string
  default = "ap-south-1"
  description = "This is mumbai region"
}
resource "aws_key_pair" "awskey" {
  #public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCM1y0/2sjo60WT3e34gaIkCW1px+cObXtCzWaS3uJfd8Fcc7u3W3E82u6PLUr5jsqXhZiEFCLHj+ad7lpknV2R+0tucatnY197GvPW5YLZtbQxyHUTDSdBK/hm2GYKJqwATVZtenig4eIp3Bu89J3mbKx5IxocvAYRLdTpZk2gVViuZdE81Auoy48VuBs/RXcgFI3JeN30X/17sLr5Z0tTPsbXwJJSflcrYKdK/kIsQjXULwcIjD/O3qwnaKxKicEb+rWoVH16ZB23YNDCNEnYL1y2gvdo8MxAd+9DQE7CqED9eNsJp6TprB5qh03jrM+k2nZ8q9X2sELqRXIAbZ8owkeoRbLzezoax30huT/jvGvlr/pqZfIXwCXDkNjbvApFL6XsJDMO1hDuPnV05jtnzfdnifGDrkbh9raqpAmsFZecgM94C/Y3sOfosp9Jz/HH5tewapiBoo/DrwvvgndZosR0vDyBp+OH5o2sbP7dgLVbvXITY8az9+xhGiXxIfc= ubuntu@ip-172-31-10-63"
  public_key =  file("/home/ubuntu/.ssh/id_rsa.pub")
  key_name = "myterrakey"
  

}
