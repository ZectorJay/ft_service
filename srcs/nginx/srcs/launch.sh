#!/bin/sh
/usr/bin/ssh-keygen -A
adduser -D "$SSH_USER"
echo "$SSH_USER:$SSH_PASSWORD" | chpasswd

/usr/bin/supervisord -c /etc/supervisord.conf