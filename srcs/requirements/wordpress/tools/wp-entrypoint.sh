#!/bin/sh

# Variables
WP_DIR="/var/www/html/wordpress"

# Check if WP-CLI is installed
if ! command -v wp &> /dev/null
then
	echo "WP-CLI could not be found, installing..."
	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
	chmod +x wp-cli.phar
	sudo mv wp-cli.phar /usr/local/bin/wp
	echo "WP-CLI installed successfully."
else
	echo "WP-CLI is already installed."
fi

# Navigate to the WordPress directory
cd $WP_DIR

# Download WordPress
echo "Downloading WordPress..."
wp core download --locale=en_US --force

# Create wp-config.php
echo "Creating wp-config.php..."
wp config create --dbname="${MYSQL_DATABASE}" --dbuser="${MYSQL_USER}" --dbpass="${MYSQL_PASSWORD}" --dbhost="${MYSQL_HOST}" --skip-check

# Install WordPress
echo "Installing WordPress..."
wp core install --url="https://${DOMAIN_NAME}" --title="${WP_TITLE}" --admin_user="${WP_OWNER_USER}" --admin_password="${WP_OWNER_PASSWORD}" --admin_email="${MYSQL_EMAIL}"

# Create a non-admin user
echo "Creating a non-admin user..."
wp user create "${WP_OWNER_USER}" "${WP_OWNER_EMAIL}" --role=author --user_pass="${WP_OWNER_PASSWORD}"

echo "WordPress installation completed."

exec php-fpm82 -F
