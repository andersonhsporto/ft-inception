FROM alpine:3.16.3

# add our user and group first to make sure their IDs get assigned consistently, regardless of whatever dependencies get added
#RUN groupadd -r mysql && useradd -r -g mysql mysql


# apk is default file manager of alpine
RUN apk update && \
    apk add --no-cache mariadb mariadb-client mariadb-server-utils

RUN systemctl start mariadb; systemctl enable mariadb

VOLUME /var/lib/mysql

EXPOSE 3306

CMD ["mariadbd"]