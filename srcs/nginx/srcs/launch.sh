openrc
touch /run/openrc/softlevel
/etc/init.d/telegraf start
rc-service sshd start
/usr/sbin/nginx -g "daemon off;"