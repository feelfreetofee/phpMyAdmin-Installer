#!/bin/bash
dnf install httpd
systemctl enable httpd
systemctl start httpd
dnf install mariadb-server mariadb
systemctl enable --now mariadb
systemctl start mariadb
dnf module reset php
dnf module install php:8.0
dnf -y install php-{curl,gd,process,snmp,xml,zip,mysqlnd,json,mbstring,pdo}
systemctl restart httpd
cd /var/www/html/
wget -q https://files.phpmyadmin.net/phpMyAdmin/5.2.0/phpMyAdmin-5.2.0-english.tar.gz
tar xf phpMyAdmin-5.2.0-english.tar.gz
rm phpMyAdmin-5.2.0-english.tar.gz
mv phpMyAdmin-5.2.0-english phpMyAdmin
mysql_secure_installation
