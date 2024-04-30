resource "aws_instance" "myinst" {
    ami = "ami-007020fd9c84e18c7"
    instance_type = "t2.micro"

    key_name = "mylbkey"
    tags =  {
        "Name" = "myec2" 
    } 
    subnet_id = aws_subnet.mysubnet1.id
    depends_on = [ aws_key_pair.myawskey]
    security_groups = ["${aws_security_group.mysg.id}"  ]
  #security group name
    user_data = file("apache.sh")
}
resource "aws_instance" "myinst1" {
    ami = "ami-007020fd9c84e18c7"
    instance_type = "t2.micro"
    key_name = "mylbkey"
    tags =  {
        "Name" = "my1ec21" 
    }
    subnet_id = aws_subnet.mysubnet2.id 
    depends_on = [ aws_key_pair.myawskey ]
    security_groups = ["${aws_security_group.mysg.id}"] #security group name
    user_data = file("apache1.sh")
}



