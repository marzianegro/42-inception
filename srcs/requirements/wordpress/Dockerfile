FROM alpine:3.19.2

RUN apk update && apk add --no-cache \
	php82 \
	php82-fpm \
	# required for a WordPress site to work
	php82-json \
	php82-mysqli \
	php82-ctype \
	php82-session \
	# highly recommended to allow WordPress to operate optimally
	php82-curl \
	php82-dom \
	php82-intl \
	php82-mbstring \
	php82-openssl \
	php82-xml \
	php82-gd \
	# may be used in certain situations or if other modules are unavailable
	php82-xmlreader \
	php82-zlib \
	php82-phar \
	# needed to download and extract WordPress
	wget \
	unzip

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp

RUN wget https://wordpress.org/latest.zip -O /tmp/latest.zip \
	&& mkdir -p /var/www/html/ \
	&& unzip /tmp/latest.zip -d /var/www/html/ \
	&& rm /tmp/latest.zip

RUN adduser -S www-data -G www-data \
	&& chown -R www-data:www-data /var/www/html/

COPY conf/www.conf /etc/php82/php-fpm.d/www.conf
# COPY conf/wp-config.php /var/www/html/wordpress/wp-config.php

EXPOSE 9000

COPY tools/wp-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/wp-entrypoint.sh
ENTRYPOINT [ "/usr/local/bin/wp-entrypoint.sh" ]

# CMD [ "php-fpm82", "-F" ]
