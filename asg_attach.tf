resource "aws_autoscaling_attachment" "asgattach" {
  autoscaling_group_name = aws_autoscaling_group.web.id
  lb_target_group_arn    =  aws_lb_target_group.mytargetgroup.arn
}
