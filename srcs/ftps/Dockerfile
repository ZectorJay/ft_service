FROM alpine:3.12

ENV ip=192.168.99.127

RUN echo "http://dl-2.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories
RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories 

RUN apk update
RUN apk add pure-ftpd
RUN apk add openrc 
RUN apk add telegraf
RUN openrc
RUN touch /run/openrc/softlevel

RUN adduser -D admin
RUN echo admin:admin | chpasswd
RUN mkdir -p ftps/admin

COPY srcs/launch.sh /
COPY srcs/check.sh /
COPY srcs/telegraf.conf /etc/
COPY srcs/pure-ftpd.pem /etc/ssl/private/
RUN chmod 600 /etc/ssl/private/pure-ftpd.pem

EXPOSE 21 21000

ENTRYPOINT [ "sh", "launch.sh" ]
