resource "aws_autoscaling_group" "web" {
  name = "web"
  min_size             = 2
  desired_capacity     = 3
  max_size             = 4
  vpc_zone_identifier  = [
    "${aws_subnet.mysubnet1.id}",
    "${aws_subnet.mysubnet2.id}"
  ]
  target_group_arns = [ aws_lb_target_group.mytargetgroup.arn ]

launch_configuration = "${aws_launch_configuration.web.name}"
tag {
    key                 = "Name"
    value               = "web"
    propagate_at_launch = true
  }
}



