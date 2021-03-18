FROM alpine:3.12

ENV ip=192.168.99.127

RUN echo "http://dl-2.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories
RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories 

RUN apk update
RUN apk add pure-ftpd
RUN apk add openrc 
RUN apk add telegraf
RUN apk add openssl

RUN openrc
RUN touch /run/openrc/softlevel

RUN adduser -D admin
RUN echo admin:admin | chpasswd
RUN mkdir -p ftps/admin

#get new ssl key
RUN openssl req -newkey rsa:4096 -days 365 -nodes -x509 -subj \
	"/C=RU/ST=Ivanovo/L=IVANOVO/O=42Kazan/OU=Ivan/CN=localhost" -keyout /etc/ssl/private/pure-ftpd.pem \
	-out /etc/ssl/private/pure-ftpd.pem

COPY srcs/launch.sh /
COPY srcs/check.sh /
COPY srcs/telegraf.conf /etc/
RUN chmod 600 /etc/ssl/private/pure-ftpd.pem

EXPOSE 21 21000 21001 21002 21003 21004 21005

ENTRYPOINT [ "sh", "launch.sh" ]
