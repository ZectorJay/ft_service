#!/bin/sh
/etc/init.d/telegraf start
/etc/init.d/mariadb setup
/etc/init.d/mariadb start
mysql --user=root -e "CREATE DATABASE wordpress; use wordpress"
mysql --user=root -e "CREATE DATABASE phpmyadmin; use phpmyadmin" 
mysql -u root -e "CREATE USER 'Admin'@'%' IDENTIFIED BY 'Admin'"
mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO 'Admin'@'%'; FLUSH PRIVILEGES;"
mysql -u root phpmyadmin < /pma.sql
mysql -u root wordpress < /wp.sql

sh usr/share/mariadb/mysql.server start