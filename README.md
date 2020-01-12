# HA Wordpress in AWS using Terraform
A full suite to install a HA WordPress installation on AWS using Terraform.

Will create:
  - Virtual Private Cloud (VPC)
  - Security Groups (SG)
  - Relational Database Service (RDS)
  - Auto-Scaling Group (ASG)
  - Elastic Load Balancer (ELB)

Steps:
  - Create new AWS account
  - Create new IAM user with Programmatic Access
  - Using credentials, create the private.auto.tfvars
  - Create your keypair in folder. Run: ssh-keygen -f mykey
  - Run Terraform
  - It will output ELB and RDS endpoints. Using ELB DNS, login and create WP database and its connections
  - Aside from setting up wp-config.php on running EC2. Additional step is to copy wp-config.php contents to /scripts/script-wpsetup.sh
  - In the terraform.tfvars, adjust the ASG_DESIRED_CAPACITY to "2" to enable HA for the WP EC2 instances
  - Run Terraform again. You now have a fully functioning HA Wordpress suite. 
