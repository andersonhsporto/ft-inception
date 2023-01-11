FROM alpine:3.16.3

RUN apk update && apk upgrade

RUN apk add --no-cache  nginx openssl

RUN mkdir -p /var/www/

RUN mkdir -p /etc/nginx/ssl

RUN chmod 700 /etc/nginx/ssl

RUN openssl req -x509 \
	-nodes \
	-days 365 \
	-newkey rsa:2048 \
	-keyout /etc/nginx/ssl/nginx.key \
	-out /etc/nginx/ssl/nginx.crt \
	-subj "/C=BR/ST=SP/L=SP/O=42SP/OU=anhigo-s"

ENTRYPOINT ["nginx", "-g", "daemon off;"]