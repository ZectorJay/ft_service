/etc/init.d/telegraf start
/etc/init.d/mariadb setup
/etc/init.d/mariadb start

mysql -u root -e "CREATE DATABASE wordpress; use wordpress"
mysql -u root -e "CREATE USER 'Admin'@'%' IDENTIFIED BY 'Admin'"
mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO 'Admin'@'%'; FLUSH PRIVILEGES;"
mysql -u root wordpress < /wp.sql

rc-update add mariadb default
sh usr/share/mariadb/mysql.server start
tail -f /dev/null