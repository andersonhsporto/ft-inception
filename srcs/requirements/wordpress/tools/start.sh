 #!/bin/bash

# This script is used to setup a WordPress site

# Check if the wp-config.php file exists
if [ ! -f "/var/www/wordpress/wp-config.php" ]; then

  # Remove all files except start.sh
	ls | grep -v start.sh | xargs rm -rf

  # Set up the WP CLI cache directory
	export WP_CLI_CACHE_DIR=/var/www/wordpress/.wp-cli/cache

  # Download and configure WordPress
	wp core download
	wp core config \
		--dbname=$MARIADB_DATABASE \
		--dbuser=$MARIADB_USER \
		--dbpass=$MARIADB_PASSWORD \
		--dbhost=$MARIADB_ROOT_HOST \
		--dbprefix='wp_' \
		--dbcharset="utf8" \
		--dbcollate="utf8_general_ci"

  # Install WordPress, create admin account and excluded from new user notification emails
	wp core install \
		--url=$DOMAIN_NAME \
		--title=$WP_TITLE \
		--admin_user=$WP_ADMIN_USR \
		--admin_password=$WP_ADMIN_PWD \
		--admin_email=$WP_ADMIN_EMAIL \
		--skip-email

  # Create a WordPress user with the specified details
	wp user create $WP_USR $WP_EMAIL --user_pass=$WP_PWD --role=subscriber
fi

# Start PHP-FPM
/usr/sbin/php-fpm7.3 --nodaemonize