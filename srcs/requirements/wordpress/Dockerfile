FROM alpine:3.19.2

RUN apk update && apk upgrade --no-cache

# install necessary packages without saving cache
RUN apk add --no-cache \
	php82 \
	php82-fpm

# required for a WordPress site to work
RUN apk add --no-cache \
	php82-json \
	php82-mysqli \
	# essential for character type checking and data validation
	php82-ctype \
	# critical for managing user sessions and logins
	php82-session

# highly recommended in order to allow WordPress to operate optimally
RUN apk add --no-cache \
	php82-curl \
	php82-dom \
	php82-intl \
	php82-mbstring \
	php82-openssl \
	php82-xml \
	# essential for image processing tasks within WordPress
	php82-gd 

# may be used in certain situations or if other modules are unavailable
RUN apk add --no-cache \
	php82-xmlreader \
	php82-zlib \
	# used for handling PHP archives, depending on plugins or tools
	php82-phar

# needed to download and extract WordPress
RUN apk add --no-cache \
	wget \
	unzip

# downloading and extracting WordPress
RUN wget https://wordpress.org/latest.zip \
	&& mkdir -p /var/www/html/ \
	&& unzip latest.zip -d /var/www/html/ \
	# removing the zip file to clean up
	&& rm latest.zip

# create user and change ownership
RUN adduser -S www-data -G www-data \
	&& chown -R www-data:www-data /var/www/html/

# copy custom PHP-FPM config file
COPY conf/www.conf /etc/php82/php-fpm.d/www.conf

# this doesn't actually publish the port to the host; it's more like
# a documentation feature unless used with `docker run -p`
EXPOSE 9000

CMD [ "php-fpm82", "-F" ]
