FROM alpine:3.12

#updating OS + wget
RUN apk update upgrade

#new repository link for openrc and telegraf
RUN echo "http://dl-2.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories

EXPOSE 80 443 22

# #install apps
RUN apk add nginx
RUN apk add vim
RUN apk add openrc
RUN apk add telegraf

#install openssl and openssh (for ssh-server)
RUN apk add openssl
RUN apk add openssh

# #nginx config
COPY /srcs/default.conf /etc/nginx/conf.d/default.conf
RUN mkdir /root/.telegraf/
COPY srcs/telegraf.conf /root/.telegraf/
COPY srcs/telegraf.conf /etc/

#get new ssl key
RUN openssl req -newkey rsa:4096 -days 365 -nodes -x509 -subj \
	"/C=RU/ST=Ivanovo/L=IVANOVO/O=42Kazan/OU=Ivan/CN=localhost" -keyout /etc/ssl/cert.key \
	-out /etc/ssl/bundle.crt
RUN chmod 600 /etc/ssl/cert.key /etc/ssl/bundle.crt

#dir for nginx_files
RUN mkdir -p /run/nginx/
RUN adduser -D -g 'www' www
RUN mkdir /www /www/wordpress /www/phpmyadmin /www/grafana

#ssh config
# COPY /srcs/sshd_config /etc/ssh/

#test page
COPY /srcs/hi.htm /www/
COPY /srcs/check.sh /
RUN chmod 755 check.sh

#user for ssh
RUN adduser -D admin -G root
RUN echo "admin:admin" | chpasswd
RUN chown -R admin:root /etc/ssh
COPY srcs/authorized_keys .ssh/
RUN chown -R admin:root /etc/ssh

# COPY /srcs/supervisord.conf /etc/supervisord.conf
COPY ./srcs/launch.sh /
RUN chmod 755 /launch.sh
CMD /launch.sh
