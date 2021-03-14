FROM alpine:3.12

ENV ip=192.168.99.119

RUN echo "http://dl-2.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories
RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories 

RUN apk update \
&& apk add pure-ftpd \
&& adduser -D admin \
&& echo admin:admin | chpasswd \
&& mkdir -p ftps/admin
RUN apk add openrc telegraf && openrc && touch /run/openrc/softlevel

COPY pure-ftpd.pem /etc/ssl/private/

RUN chmod 600 /etc/ssl/private/pure-ftpd.pem

COPY launch.sh /
COPY check.sh /
COPY ./telegraf.conf /etc/

EXPOSE 21 21000

ENTRYPOINT [ "sh", "launch.sh" ]
