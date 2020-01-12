AWS_REGION                            = "ap-southeast-2"

# VPC Variables
VPC_CIDR_BLOCK                        = "10.0.0.0/16"
VPC_PUBLIC_SUBNET1_CIDR_BLOCK         = "10.0.1.0/24"
VPC_PUBLIC_SUBNET2_CIDR_BLOCK         = "10.0.2.0/24"
VPC_PUBLIC_SUBNET3_CIDR_BLOCK         = "10.0.3.0/24"
VPC_PRIVATE_SUBNET1_CIDR_BLOCK        = "10.0.4.0/24"
VPC_PRIVATE_SUBNET2_CIDR_BLOCK        = "10.0.5.0/24"
VPC_PRIVATE_SUBNET3_CIDR_BLOCK        = "10.0.6.0/24"

# RDS variable
RDS_DB_NAME                           = "wordpress"
RDS_CIDR_IN                           = "0.0.0.0/0"
RDS_STORAGE_TYPE                      = "gp2"
RDS_INSTANCE_CLASS                    = "db.t2.micro"
RDS_ENGINE                            = "mysql"
RDS_ENGINE_VERSION                    = "8.0.16"
RDS_BACKUP_RETENTION_PERIOD           = "7"
RDS_PUBLICLY_ACCESSIBLE               = "true"
RDS_USERNAME                          = "test"
RDS_PASSWORD                          = "test123$%"
RDS_ALLOCATED_STORAGE                 = "20"
RDS_ENGINE_PARAMETER_GROUP_FAMILY     = "mysql8.0"
RDS_IDENTIFIER                        = "wordpress-db"
RDS_MULTIAZ                           = "true"

# ELB variables
ELB_NAME                              = "wordpress-elb"

# EC2/Launch Configuration variables
ASG_AMI                               = "ami-0b8b10b5bf11f3a22"
ASG_INSTANCE_TYPE                     = "t2.micro"
ASG_MIN_INSTANCE                      = "1"
ASG_MAX_INSTANCE                      = "5"
ASG_DESIRED_CAPACITY                  = "1"
ASG_USER_DATA_WPSTP                   = "./scripts/script-wpsetup.sh"

# Key variables
PATH_TO_PRIVATE_KEY                   = "mykey"
PATH_TO_PUBLIC_KEY                    = "mykey.pub"
