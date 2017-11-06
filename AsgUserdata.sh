#!/bin/bash
sudo su
cd /etc
echo "*/5 * * * * aws s3 sync --delete /var/www/html/wp-content/uploads s3://Web-media" >> crontab
echo "*/5 * * * * aws s3 sync --delete /var/www/html/ s3://Web-code" >> crontab
service crond restart