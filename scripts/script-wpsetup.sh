#!/bin/bash
sudo -i
yum update -y
sudo yum install -y httpd
sudo amazon-linux-extras install -y php7.2
yum install wget -y
wget http://repo.mysql.com/mysql-community-release-el6-5.noarch.rpm
rpm -ivh mysql-community-release-el6-5.noarch.rpm
yum install mysql-server -y
yum install  php-mysqlnd -y
cd /var/www/html
echo "healthy" > healthy.html
wget https://wordpress.org/latest.tar.gz
tar -xzf latest.tar.gz
cp -r wordpress/* /var/www/html/
rm -rf wordpress
rm -rf latest.tar.gz
chmod -R 755 wp-content
chown -R apache:apache wp-content
chkconfig httpd on
service httpd start
#cat > /var/www/html/wp-config.php <<'TXT'
## INSERT THE wp-config.php contents here. Then update ASG_DESIRED_CAPACITY to "2" in terraform.tfvars
#TXT
