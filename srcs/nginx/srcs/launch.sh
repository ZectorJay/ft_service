/usr/bin/ssh-keygen -A

adduser -D admin -G root
echo "admin:admin" | chpasswd
chown -R admin:root /etc/ssh

rc-service telegraf start
rc-service sshd start

/usr/sbin/nginx -g "daemon off;"