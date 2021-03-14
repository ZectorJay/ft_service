FROM alpine:3.12

RUN echo "http://dl-2.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories
RUN apk update
RUN apk add grafana telegraf openrc
RUN openrc && touch /run/openrc/softlevel
RUN apk add vim

#COPY srcs/grafana.db /usr/share/grafana/data/
COPY srcs/check.sh /
COPY srcs/grafana.ini /etc/
COPY srcs/start.sh /
COPY srcs/influxdb.yaml /usr/share/grafana/conf/provisioning/datasources/influxdb.yaml
COPY srcs/dashboards.yaml /usr/share/grafana/conf/provisioning/dashboards/dashboards.yaml
COPY srcs/telegraf.conf /etc/
COPY srcs/default.json /usr/share/grafana/public/dashboards/
COPY srcs/default.json /usr/share/grafana/public/dashboards/dashboard.json

ENTRYPOINT sh start.sh
