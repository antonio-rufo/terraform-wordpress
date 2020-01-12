# endpoint outputs
output "rds_prod_endpoint" {
  value = "${aws_db_instance.rds-instance.address}"
}
output "ELB_endpoint" {
  value = aws_elb.elb-wordpress.dns_name
}
