FROM wordpress:php7.4-fpm

RUN apt-get update && apt-get install -y \
	# these two are needed to download and extract WordPress
	wget \
	unzip \
	# cleaning up package lists to keep the image size down
	&& rm -rf /var/lib/apt/lists/*
	
	# downloading and extracting WordPress
	RUN wget https://wordpress.org/latest.zip \
    && unzip latest.zip -d /var/www/html/ \
	# removing the zip file to clean up
    && rm latest.zip

# changing ownership
RUN chown -R www-data:www-data /var/www/html/wordpress

# this doesn't actually publish the port to the host; it's more
# like a documentation feature unless used with `docker run -p`
EXPOSE 9000

CMD [ "php-fpm" ]
