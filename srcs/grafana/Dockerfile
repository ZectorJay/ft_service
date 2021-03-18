FROM alpine:3.12

RUN echo "http://dl-2.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories

RUN apk update

RUN apk add grafana
RUN apk add telegraf 
RUN apk add openrc
RUN apk add vim

RUN openrc
RUN touch /run/openrc/softlevel

COPY srcs/check.sh /
COPY srcs/grafana.ini /etc/
COPY srcs/launch.sh /
COPY srcs/influxdb.yaml /usr/share/grafana/conf/provisioning/datasources/influxdb.yaml
COPY srcs/dashboards.yaml /usr/share/grafana/conf/provisioning/dashboards/dashboards.yaml
COPY srcs/default.json /usr/share/grafana/public/dashboards/
COPY srcs/telegraf.conf /etc/

ENTRYPOINT sh launch.sh
