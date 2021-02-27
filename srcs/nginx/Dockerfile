FROM alpine:3.12

#updating OS + wget
RUN apk update
RUN apk	upgrade

EXPOSE 80
EXPOSE 443
EXPOSE 22

# #install Nginx (remove vim later)
RUN apk add nginx
RUN apk add vim
RUN apk add supervisor

#install openssl and openssh (for ssh-server)
RUN apk add openssl
RUN apk add openssh

# #nginx config
COPY /srcs/default.conf /etc/nginx/conf.d/default.conf

#get new ssl key
RUN openssl req -newkey rsa:4096 -days 365 -nodes -x509 -subj "/C=RU/ST=Ivanovo/L=IVANOVO/O=42Kazan/OU=Ivan/CN=localhost" -keyout /etc/ssl/cert.key -out /etc/ssl/bundle.crt
RUN chmod 600 /etc/ssl/cert.key /etc/ssl/bundle.crt

#dir for nginx_files
RUN mkdir -p /run/nginx/
RUN adduser -D -g 'www' www
RUN mkdir /www

#user for ssh and generate key for host
# RUN	/usr/bin/ssh-keygen -A 
COPY /srcs/sshd_config /etc/ssh/
# RUN adduser -D "SSH_USER"
# RUN echo "SSH_USER:SSH_PASSWORD" | chpasswd
# RUN ssh-keygen -A

#test page
COPY /srcs/hi.htm /www/
COPY /srcs/supervisord.conf /etc/supervisord.conf
#script to make containder "not daemon"
COPY ./srcs/launch.sh /
RUN chmod 755 /launch.sh
# CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]
CMD /launch.sh
