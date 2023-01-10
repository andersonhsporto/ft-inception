FROM alpine:3.16.3

RUN apk update && apk upgrade

RUN apk add --no-cache  mariadb \
                        mariadb-client \
                        mariadb-server-utils

RUN mkdir -p /run/mysqld

COPY ./conf/config.cnf /etc/my.cnf

RUN chown -R mysql:mysql /var/lib/mysql
RUN chmod 777 /var/lib/mysql

COPY ./tools/run.sh /tmp/run_mariadb.sh
RUN chmod +x /tmp/run_mariadb.sh

ENTRYPOINT ["sh", "/tmp/run_mariadb.sh"]