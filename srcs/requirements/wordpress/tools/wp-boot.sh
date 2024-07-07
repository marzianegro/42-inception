#!/bin/bash

# run WP-CLI install command
# administrator user
wp --path=/var/www/html/wordpress core install --url="https://${DOMAIN_NAME}" --title="${WP_TITLE}" \
		--admin_user="${WP_OWNER}" --admin_password="${WP_OWNER_PASSWORD}" --admin_email="${WP_OWNER_EMAIL}"

# test user
wp --path=/var/www/html/wordpress user create "${WP_GUEST}" "${WP_GUEST_EMAIL}" \
          --role=author --user_pass="${WP_GUEST_PASSWORD}"

exec php-fpm82 -F
