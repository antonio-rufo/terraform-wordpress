resource "aws_launch_configuration" "lc-wordpress" {
  name_prefix     = "lc-wordpress"
  image_id        = var.ASG_AMI
  instance_type   = var.ASG_INSTANCE_TYPE
  key_name        = aws_key_pair.mykeypair.key_name
  security_groups = [aws_security_group.ec2-securitygroup.id]
  user_data       = file(var.ASG_USER_DATA_WPSTP)
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "asg-wordpress" {
  name                      = "asg-wordpress"
  vpc_zone_identifier       = [aws_subnet.main-public-1.id, aws_subnet.main-public-2.id, aws_subnet.main-public-3.id]
  launch_configuration      = aws_launch_configuration.lc-wordpress.name
  min_size                  = var.ASG_MIN_INSTANCE
  max_size                  = var.ASG_MAX_INSTANCE
  desired_capacity          = var.ASG_DESIRED_CAPACITY
  health_check_grace_period = 300
  health_check_type         = "ELB"
  load_balancers            = [aws_elb.elb-wordpress.name]
  force_delete              = true

  tag {
    key                 = "Name"
    value               = "WP-Instance"
    propagate_at_launch = true
  }
}
