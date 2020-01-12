resource "aws_security_group" "elb-securitygroup" {
  vpc_id      = aws_vpc.main.id
  name        = "ELB-SG"
  description = "security group for load balancer"
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "ELB-SG"
  }
}

resource "aws_security_group" "ec2-securitygroup" {
  vpc_id      = aws_vpc.main.id
  name        = "WP-SG"
  description = "security group for ec2 instances"
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "WP-SG"
  }
}

resource "aws_security_group" "rds-securitygroup" {
  vpc_id      = aws_vpc.main.id
  name        = "RDS-SG"
  description = "security group for RDS DB"
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = [var.RDS_CIDR_IN]
  }
  tags = {
    Name = "RDS-SG"
  }
}
