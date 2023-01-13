#!/bin/bash

# Create Database && Securing database engine installation
if [ ! -d "/var/lib/mysql/${MARIADB_DATABASE}" ]; then
	#Create the database
	mysql_install_db --user=mysql --datadir="/var/lib/mysql" > /dev/null
	#Change permissions for user access
	chown -R mysql:mysql /var/lib/mysql

	#Start MySQL service
	service mysql start
	
	#Create user and grant privileges 
	mysql --user=root --password="" <<_EOF_
	CREATE DATABASE ${MARIADB_DATABASE};
	USE ${MARIADB_DATABASE};
	GRANT ALL ON *.* TO '${MARIADB_USER}'@'%' IDENTIFIED BY '${MARIADB_PASSWORD}';
	GRANT ALL ON *.* TO '${MARIADB_USER}'@'localhost' IDENTIFIED BY '${MARIADB_PASSWORD}';
	FLUSH PRIVILEGES;
	DELETE FROM mysql.user WHERE User='';
	DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');
	DROP DATABASE IF EXISTS test;
	DELETE FROM mysql.db WHERE Db='test' OR Db='test\\_%';
	FLUSH PRIVILEGES;
	ALTER USER 'root'@'localhost' IDENTIFIED BY '${MARIADB_ROOT_PASSWORD}';
	FLUSH PRIVILEGES;
_EOF_

	#Update root user to use new password
	sed -i "s/password =/password = ${MARIADB_ROOT_PASSWORD}/g" /etc/mysql/debian.cnf
	
	#Stop MySQL service
	service mysql stop
fi

#Run MySQL Securely 
/usr/bin/mysqld_safe --user=mysql --datadir=/var/lib/mysql