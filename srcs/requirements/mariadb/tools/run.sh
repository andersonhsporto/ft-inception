#!/bin/sh

mkdir /auth_pam_tool_dir
touch /auth_pam_tool_dir/auth_pam_tool
mysql_install_db --user=root \
								--basedir=/usr \
								--datadir=/var/lib/mysql \
								--skip-test-db


cat > /tmp/mysql_init << EOF
FLUSH PRIVILEGES;
CREATE DATABASE IF NOT EXISTS $MARIADB_DATABASE;
CREATE USER IF NOT EXISTS '$MARIADB_USER'@'%' IDENTIFIED BY '$MARIADB_PASSWORD';
GRANT ALL PRIVILEGES ON $MARIADB_DATABASE.* TO '$MARIADB_USER'@'%';
ALTER USER 'root'@'localhost' IDENTIFIED BY '$MARIADB_ROOT_PASSWORD';
FLUSH PRIVILEGES;
EOF
/usr/bin/mysqld --user=root --bootstrap < /tmp/mysql_init
/usr/bin/mysqld --user=root