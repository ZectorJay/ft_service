FROM alpine:3.12

EXPOSE 5050

#updating OS
RUN echo "http://dl-2.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories
RUN apk update
RUN apk	upgrade
RUN apk add openrc
RUN apk add telegraf
RUN	apk add vim
RUN apk add wget
RUN apk add nginx

RUN apk add php7-fpm php7 php7-mysqli \
	php7-mbstring php7-json php7-session

RUN wget http://wordpress.org/latest.tar.gz
RUN tar -xzvf latest.tar.gz && rm latest.tar.gz
RUN mv wordpress /var/www/localhost/htdocs/wordpress
COPY srcs/wp-config.php /var/www/html/wordpress/wp-config.php

#nginx setups
RUN mkdir -p /run/nginx/
RUN adduser -D -g 'www' www
RUN mkdir /www
COPY /srcs/default.conf /etc/nginx/conf.d/default.conf

COPY /srcs/launch.sh /
RUN chmod 755 /launch.sh
CMD /launch.sh