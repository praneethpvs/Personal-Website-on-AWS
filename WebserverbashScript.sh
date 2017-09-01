#!/bin/bash
yum update -y
yum install php php-mysql http -y
yum install -y gcc make
yum install -y php-pear
pear install Log
yum install -y pcre-devel
yum install -y php56-opcache
yum install -y re2c
yum install -y mod24_ssl
yum install -y memcached
yum install -y php56-pecl-memcached
cd /etc/httpd/conf
cp httpd.conf httpdbackup.conf
rm -rf httpd.conf
wget https://github.com/praneethpvs/Personal-Website-on-AWS/blob/master/httpd.conf
cd /var/www/html
echo "This instance is healthy" > healthy.html
wget https://wordpress.org/latest.tar.gz
tar -xzf latest.tar.gz
cp -r wordpress/* /var/www/html/
rm -rf wordpress
rm -rf latest.tar.gz
chmod -R 755 wp-content
chown -R apache:apache /var/www/html
service httpd start
chkconfig httpd on
