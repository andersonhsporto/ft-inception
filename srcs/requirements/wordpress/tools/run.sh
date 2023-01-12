##!/bin/sh

sleep 5

if [ -f ./wp-config.php ]
then
	echo "Wordpress already installed"
else

echo "Installing Wordpress..."

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

chmod 777 -R /var/www

cd /var/www

wp core download --path=/var/www/ --allow-root

cp /www/wp-config.php /var/www

wp core install --allow-root \
					--path=/var/www/ \
					--url=$WP_URL \
					--title=$WP_TITLE \
					--admin_user=$WP_USER \
					--admin_password=$WP_PASSWORD \
					--admin_email=$WP_EMAIL

wp user create \
	--allow-root \
	--path=/var/www/ \
	$WP_USER2 \
	$WP_EMAIL2 \
	--role=author \
	--user_pass=$WP_PASSWORD2

sleep 5

echo "Wordpress installed"
fi
exec php-fpm8 -F