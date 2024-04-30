resource "aws_launch_configuration" "web" {
  name_prefix = "web-"
image_id = "ami-0f58b397bc5c1f2e8" 
  instance_type = "t2.micro"
  key_name = "mylbkey"
  security_groups = ["${aws_security_group.mysg.id}"  ]
  
  user_data = "${file("data.sh")}"
lifecycle {
    create_before_destroy = true
  }
}

