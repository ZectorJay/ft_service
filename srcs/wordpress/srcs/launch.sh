openrc
touch /run/openrc/softlevel

/etc/init.d/telegraf start
rc-service -v php-fpm7 start
nginx -g 'daemon off;'