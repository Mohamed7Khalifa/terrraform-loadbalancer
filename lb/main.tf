#---------------------------"application load balancer"----------------------------
resource "aws_lb" "iti-app-load_balancer" {
  name               = "iti-application-loadbalancer"
  internal           = false
  security_groups    = [aws_security_group.nginx-lab.id]
  subnets            = [aws_subnet.subnets_az1[0].id,aws_subnet.subnets_az2[0].id]
  load_balancer_type = "application"
}

resource "aws_lb_listener" "lb_listener" {
  load_balancer_arn = aws_lb.iti-app-load_balancer.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    target_group_arn = aws_lb_target_group.target_group.arn
    type             = "forward"
  }
}

resource "aws_lb_target_group" "target_group" {
  name     = "target_group"
  port     = "80"
  protocol = "HTTP"
  vpc_id   = aws_vpc.iti-vpc
}

resource "aws_lb_target_group_attachment" "target_group_attachment" {
  target_group_arn = aws_lb_target_group.target_group.arn
  target_id        = aws_instance.public-ec2.id
  port             = 80
}

resource "aws_lb_health_check" "lb_health_check" {
  target              = "TCP:80"
  interval            = 30
  timeout             = 5
  healthy_threshold   = 2
  unhealthy_threshold = 2
}
#---------------------------"application load balancer"----------------------------
resource "aws_lb" "iti-network-load_balancer" {
  name               = "iti-network-loadbalancer"
  internal           = true
  security_groups    = [aws_security_group.private-ec2.id]
  subnets            = [aws_subnet.subnets_az1[1].id,aws_subnet.subnets_az2[1].id]
  load_balancer_type = "network"
}