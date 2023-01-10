#!/bin/sh

mkdir /auth_pam_tool_dir
touch /auth_pam_tool_dir/auth_pam_tool
mysql_install_db --user=root \
								--basedir=/usr \
								--datadir=/var/lib/mysql \
								--skip-test-db


cat > /tmp/mysql_init << EOF
FLUSH PRIVILEGES;
CREATE DATABASE IF NOT EXISTS $DB_NAME;
CREATE USER IF NOT EXISTS '$USER_ID'@'%' IDENTIFIED BY '$USER_PASSWORD';
GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$USER_ID'@'%';
ALTER USER 'root'@'localhost' IDENTIFIED BY '$DB_ROOT_PASSWORD';
FLUSH PRIVILEGES;
EOF
/usr/bin/mysqld --user=root --bootstrap < /tmp/mysql_init
/usr/bin/mysqld --user=root