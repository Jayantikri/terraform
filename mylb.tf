resource "aws_lb" "mylb" {
  name = "mylb"
  internal = false
  load_balancer_type = "application"
  security_groups = [
    "${aws_security_group.mysg.id}"
  ]
  subnets = [
    "${aws_subnet.mysubnet1.id}",
    "${aws_subnet.mysubnet2.id}"
  ]

  
  tags = {
    Environment = "testing"
}
}
