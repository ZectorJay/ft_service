FROM alpine:3.12

EXPOSE 5050

#updating OS
RUN apk update
RUN apk	upgrade
RUN	apk add vim
RUN apk add wget

RUN apk add lighttpd php7-common php7-iconv \
	php7-json php7-gd php7-curl php7-xml \
	php7-mysqli php7-imap php7-cgi \
	fcgi php7-pdo php7-pdo_mysql \
	php7-soap php7-xmlrpc php7-posix \
	php7-mcrypt php7-gettext \
	php7-ldap php7-ctype php7-dom

RUN mkdir -p /usr/share/webapps/
RUN wget http://wordpress.org/latest.tar.gz
RUN tar -xzvf latest.tar.gz && rm latest.tar.gz
RUN mv wordpress /var/www/html/
COPY srcs/wp-config.php /var/www/html/wordpress/wp-config.php

COPY /srcs/launch.sh /
RUN chmod 755 /launch.sh
CMD /launch.sh