FROM alpine:3.12

RUN echo "http://dl-2.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories

RUN apk update

RUN apk add php7-common php7-iconv php7-json php7-gd php7-curl \
	php7-xml php7-mysqli php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql \
	php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap \
	php7-ctype php7-dom php php-fpm 

RUN apk add nginx
RUN apk add telegraf
RUN apk add openrc 
RUN mkdir -p /run/nginx

COPY srcs/telegraf.conf /etc/
COPY srcs/check.sh /

RUN wget http://wordpress.org/latest.tar.gz
RUN tar -xzvf latest.tar.gz
RUN rm latest.tar.gz
RUN mv wordpress /var/www/localhost/htdocs/

COPY srcs/wp-config.php /var/www/localhost/htdocs/wordpress/

COPY srcs/default.conf /etc/nginx/conf.d
COPY /srcs/launch.sh .

ENTRYPOINT sh launch.sh