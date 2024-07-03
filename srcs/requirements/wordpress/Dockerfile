FROM alpine:3.19.2

# install necessary packages without saving cache
RUN apk add --no-cache \
	php8 \
	php8-fpm

# required for a WordPress site to work
RUN apk add --no-cache \
	php8-json \
	php8-mysqli \
	# essential for character type checking and data validation
	php8-ctype \
	# critical for managing user sessions and logins
	php8-session

# highly recommended in order to allow WordPress to operate optimally
RUN apk add --no-cache \
	php8-curl \
	php8-dom \
	php8-intl \
	php8-mbstring \
	php8-openssl \
	php8-xml \
	# essential for image processing tasks within WordPress
	php8-gd 

# may be used in certain situations or if other modules are unavailable
RUN apk add --no-cache \
	php8-xmlreader \
	php8-zlib \
	# used for handling PHP archives, depending on plugins or tools
	php8-phar

# needed to download and extract WordPress
RUN apk add --no-cache \
	wget \
	unzip

# downloading and extracting WordPress
RUN wget https://wordpress.org/latest.zip \
&& unzip latest.zip -d /var/www/html/ \
&& rm latest.zip # removing the zip file to clean up

# changing ownership
RUN chown -R www-data:www-data /var/www/html/wordpress

# this doesn't actually publish the port to the host; it's more like
# a documentation feature unless used with `docker run -p`
EXPOSE 9000

CMD [ "php8-fpm" ]
