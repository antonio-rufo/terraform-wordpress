# "aws" provider variables
variable "AWS_ACCESS_KEY" {}
variable "AWS_SECRET_KEY" {}
variable "AWS_REGION" {}

# VPC variables
variable "VPC_CIDR_BLOCK" {}
variable "VPC_PUBLIC_SUBNET1_CIDR_BLOCK" {}
variable "VPC_PUBLIC_SUBNET2_CIDR_BLOCK" {}
variable "VPC_PUBLIC_SUBNET3_CIDR_BLOCK" {}
variable "VPC_PRIVATE_SUBNET1_CIDR_BLOCK" {}
variable "VPC_PRIVATE_SUBNET2_CIDR_BLOCK" {}
variable "VPC_PRIVATE_SUBNET3_CIDR_BLOCK" {}

# RDS variables
variable "RDS_DB_NAME" {}
variable "RDS_CIDR_IN" {}
variable "RDS_INSTANCE_CLASS" {}
variable "RDS_ENGINE" {}
variable "RDS_ENGINE_VERSION" {}
variable "RDS_BACKUP_RETENTION_PERIOD" {}
variable "RDS_PUBLICLY_ACCESSIBLE" {}
variable "RDS_USERNAME" {}
variable "RDS_PASSWORD" {}
variable "RDS_ALLOCATED_STORAGE" {}
variable "RDS_ENGINE_PARAMETER_GROUP_FAMILY" {}
variable "RDS_IDENTIFIER" {}
variable "RDS_MULTIAZ" {}
variable "RDS_STORAGE_TYPE" {}

# ELB variables
variable "ELB_NAME" {}

# Web variables
variable "ASG_AMI" {}
variable "ASG_INSTANCE_TYPE" {}
variable "ASG_MIN_INSTANCE" {}
variable "ASG_MAX_INSTANCE" {}
variable "ASG_DESIRED_CAPACITY" {}
variable "ASG_USER_DATA_WPSTP" {}

# Key variables
variable "PATH_TO_PRIVATE_KEY" {}
variable "PATH_TO_PUBLIC_KEY" {}
