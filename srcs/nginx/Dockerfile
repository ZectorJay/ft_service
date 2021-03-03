FROM alpine:3.12

#updating OS + wget
RUN apk update
RUN apk	upgrade
RUN apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/
EXPOSE 80
EXPOSE 443
EXPOSE 22

# #install Nginx (remove vim later)
RUN echo "http://dl-2.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories
RUN apk add nginx
RUN apk add vim
RUN apk add supervisor
RUN apk add openrc
RUN apk add telegraf

#install openssl and openssh (for ssh-server)
RUN apk add openssl
RUN apk add openssh

# #nginx config
COPY /srcs/default.conf /etc/nginx/conf.d/default.conf
RUN mkdir /root/.telegraf/
COPY srcs/telegraf.conf /root/.telegraf/

#get new ssl key
RUN openssl req -newkey rsa:4096 -days 365 -nodes -x509 -subj "/C=RU/ST=Ivanovo/L=IVANOVO/O=42Kazan/OU=Ivan/CN=localhost" -keyout /etc/ssl/cert.key -out /etc/ssl/bundle.crt
RUN chmod 600 /etc/ssl/cert.key /etc/ssl/bundle.crt

#dir for nginx_files
RUN mkdir -p /run/nginx/
RUN adduser -D -g 'www' www
RUN mkdir /www

#ssh config
COPY /srcs/sshd_config /etc/ssh/

#test page
COPY /srcs/hi.htm /www/

# COPY /srcs/supervisord.conf /etc/supervisord.conf
COPY ./srcs/launch.sh /
RUN chmod 755 /launch.sh
CMD /launch.sh
