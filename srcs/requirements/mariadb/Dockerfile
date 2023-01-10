FROM alpine:3.16.3
 
RUN apk update && \
    apk add --no-cache mariadb mariadb-client mariadb-server-utils

RUN mkdir /run/mysqld && chown mysql /run/mysqld

RUN mysql_install_db --user=mysql --datadir=/var/lib/mysql --auth-root-authentication-method=normal

COPY ./conf/maria.cnf /etc/my.cnf.d/mariadb-server.cnf

EXPOSE 3306

CMD ["mysqld", "--user=mysql"]