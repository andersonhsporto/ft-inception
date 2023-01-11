FROM alpine:3.16.3

RUN apk update && apk upgrade

RUN apk add bash \
    php8 \
    php8-fpm \
    php8-mysqli \
    php8-opcache \
    php8-gd \
    php8-zlib \
    php8-curl \
    php8-bcmath \
    php8-ctype \
    php8-iconv \
    php8-intl \
    php8-json \
    php8-mbstring \
    php8-mysqlnd \
    php8-openssl \
    php8-pdo \
    php8-pdo_mysql \
    php8-pdo_pgsql \
    php8-pdo_sqlite \
    php8-phar \
    php8-posix \
    php8-session \
    php8-soap \
    php8-xml \
    php8-zip \
    libmcrypt-dev \
	curl \
	libltdl

RUN apk add lighttpd
RUN apk add mariadb-client

RUN apk update

RUN adduser -u 82 -D -S -G www-data www-data
RUN chown -R www-data:www-data /var/www
RUN chmod 777 /var/www

COPY ./conf/www.conf /etc/php8/php-fpm.d/www.conf
COPY ./conf/wp-config.php /www/wp-config.php
COPY ./tools/run.sh /tmp/run_wordpress.sh

RUN chmod +x /tmp/run_wordpress.sh

ENTRYPOINT ["sh", "/tmp/run_wordpress.sh"]