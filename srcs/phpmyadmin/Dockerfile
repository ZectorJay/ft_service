FROM alpine:3.12

RUN echo "http://dl-2.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories

RUN apk update

RUN apk add php7-common php7-iconv php7-json php7-gd php7-curl \
    && apk add php7-xml php7-mysqli php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql \
    && apk add php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap \
    && apk add php7-ctype php7-dom && apk add php php-fpm php-session php-mbstring \
    php-gettext

#run main aps
RUN apk add nginx
RUN apk add openssl
RUN apk add openrc
RUN apk add vim
RUN apk add telegraf

RUN set -x ; \
  addgroup -g 82 -S www-data ; \
  adduser -u 82 -D -S -G www-data www-data && exit 0 ; exit 1

#add dir's for php/nginx
RUN mkdir -p /run/nginx/
RUN mkdir /usr/share/webapps/ /var/www/html

#install php and make links??
RUN wget https://www.phpmyadmin.net/downloads/phpMyAdmin-latest-all-languages.tar.gz
RUN tar -xvf phpMyAdmin-latest-all-languages.tar.gz
RUN mv phpMyAdmin-5.1.0-all-languages phpmyadmin
RUN mv phpmyadmin /usr/share/webapps/

#copy configs
COPY srcs/default.conf /etc/nginx/conf.d/
COPY srcs/launch.sh /
COPY srcs/check.sh /
COPY srcs/config.inc.php /usr/share/webapps/phpmyadmin/
COPY srcs/telegraf.conf /etc/

#ssl key
RUN openssl req -newkey rsa:4096 -days 365 -nodes -x509 -subj \
	"/C=RU/ST=Ivan/L=IVAN/O=Kazan/OU=Ivan/CN=localhost" -keyout /etc/ssl/cert.key \
	-out /etc/ssl/bundle.crt
RUN chmod 600 /etc/ssl/cert.key /etc/ssl/bundle.crt

#change rights
RUN chmod -R 777 /usr/share/webapps/
RUN ln -s /usr/share/webapps/phpmyadmin/ /var/www/localhost/htdocs/phpmyadmin
RUN ln -s /usr/share/webapps/phpmyadmin/ /var/www/html/
RUN chown -R www-data:www-data /usr/share/webapps/phpmyadmin/ /var/www/html
RUN chmod -R a-x,a=rX,u+w /usr/share/webapps/phpmyadmin/ /var/www/html

EXPOSE 5000

ENTRYPOINT sh launch.sh