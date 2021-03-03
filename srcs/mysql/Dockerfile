FROM alpine:3.12

EXPOSE 3306

#updating OS
RUN apk update
RUN apk	upgrade
RUN	apk add vim
RUN apk add wget
RUN apk add mysql mysql-client
RUN apk add mariadb-server


COPY /srcs/launch.sh /
RUN chmod 755 /launch.sh
CMD /launch.sh