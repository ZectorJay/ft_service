#!/bin/sh
mysql
php7.3-fpm

echo "CREATE USER 'adm'@'localhost' IDENTIFIED BY 'adm';" | mysql -u root
echo "create database wordpress;" | mysql -u root
echo "grant all privileges on wordpress.* to 'adm'@'localhost' identified by     'adm';" | mysql -u root
echo "flush privileges;" | mysql -u root

