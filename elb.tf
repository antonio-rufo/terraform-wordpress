resource "aws_elb" "elb-wordpress" {
  name            = var.ELB_NAME
  subnets         = [aws_subnet.main-public-1.id, aws_subnet.main-public-2.id, aws_subnet.main-public-3.id]
  security_groups = [aws_security_group.elb-securitygroup.id]
  listener {
    instance_port     = 80
    instance_protocol = "tcp"
    lb_port           = 80
    lb_protocol       = "tcp"
  }
  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 5
    target              = "TCP:80"
    interval            = 300
  }
  cross_zone_load_balancing   = true
  connection_draining         = true
  connection_draining_timeout = 400
  tags = {
    Name = "wordpress-elb"
  }
}
