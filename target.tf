resource "aws_lb_target_group" "mytargetgroup" {
  name = "mytargetgroup"
  target_type = "instance"
  port = "80"
  protocol = "HTTP"
  vpc_id = aws_vpc.myvpc.id

}
resource "aws_lb_target_group_attachment" "pk" {
    target_group_arn = aws_lb_target_group.mytargetgroup.arn
    target_id        = aws_instance.myinst.id
    port             = 80
  
}
resource "aws_lb_target_group_attachment" "pk1" {
    target_group_arn = aws_lb_target_group.mytargetgroup.arn
    target_id        = aws_instance.myinst1.id
    port             = 80
}
resource "aws_lb_listener" "mylistner" {
    load_balancer_arn = aws_lb.mylb.arn
    port              = "80"
    default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.mytargetgroup.arn
  }
}
