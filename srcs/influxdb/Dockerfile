FROM alpine:3.12

RUN echo "http://dl-2.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories

RUN apk update

RUN apk add influxdb
RUN apk add openrc
RUN apk add telegraf

RUN openrc
RUN touch /run/openrc/softlevel

COPY srcs/launch.sh /
COPY srcs/check.sh /
COPY srcs/telegraf.conf /etc/

VOLUME [ "/var/lib/influxdb" ]

EXPOSE 8086

ENTRYPOINT sh launch.sh
