resource "aws_db_instance" "rds-instance" {
  name                        = var.RDS_DB_NAME
  identifier                  = var.RDS_IDENTIFIER
  allocated_storage           = var.RDS_ALLOCATED_STORAGE
  storage_type                = var.RDS_STORAGE_TYPE
  engine                      = var.RDS_ENGINE
  engine_version              = var.RDS_ENGINE_VERSION
  instance_class              = var.RDS_INSTANCE_CLASS
  backup_retention_period     = var.RDS_BACKUP_RETENTION_PERIOD
  publicly_accessible         = var.RDS_PUBLICLY_ACCESSIBLE
  username                    = var.RDS_USERNAME
  password                    = var.RDS_PASSWORD
  vpc_security_group_ids      = [aws_security_group.rds-securitygroup.id]
  db_subnet_group_name        = aws_db_subnet_group.rds-subnet-group.name
  parameter_group_name        = aws_db_parameter_group.rds-parameters.name
  multi_az                    = var.RDS_MULTIAZ
  skip_final_snapshot         = "true"
}

resource "aws_db_parameter_group" "rds-parameters" {
  name        = "rds-parameters"
  family      = var.RDS_ENGINE_PARAMETER_GROUP_FAMILY
  description = "MySQL parameter group"
}

resource "aws_db_subnet_group" "rds-subnet-group" {
    name          = "rds-subnet-group"
    description   = "Allowed subnets for RDS cluster instances"
    subnet_ids    = [aws_subnet.main-private-1.id, aws_subnet.main-private-2.id,aws_subnet.main-private-3.id]
}
