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

dnf update
dnf clean all
dnf upgrade
dnf install epel-release
dnf group list
dnf groupinstall "Development Tools"
dnf install tar git wget 
dnf install python39
cd
git clone https://github.com/vincejv/cloudflare-ddns-client
cd cloudflare-ddns-client
make install
rm -rf cloudflare-ddns-client
cloudflare-ddns --configure
export EDITOR="nano"
crontab -e
55 23 * * * /usr/local/bin/cloudflare-ddns --update-now

firewall-cmd --zone=public --add-port=80/tcp --permanent
firewall-cmd --zone=public --add-port=443/tcp --permanent
firewall-cmd --zone=public --add-port=443/udp --permanent
firewall-cmd --zone=public --permanent --add-service=https
firewall-cmd --reload
firewall-cmd --list-all

firewall-cmd --zone=public --add-port=40120/tcp --permanent
firewall-cmd --zone=public --add-port=40120/udp --permanent
firewall-cmd --zone=public --add-port=30120/tcp --permanent
firewall-cmd --zone=public --add-port=30120/udp --permanent

dnf install certbot python3-certbot-apache
cd /etc/httpd/conf.d/

nano timerp.eu.org.conf

<VirtualHost *:80>
ServerName timerp.eu.org
ServerAlias *.timerp.eu.org
DocumentRoot /var/www/html
</VirtualHost>

certbot --apache

55 23 * * * /usr/local/bin/cloudflare-ddns --update-now
00 00 * * * reboot
@reboot setsid sh /root/server/run.sh

dnf install python39-pip
pip-3.6 install tld

