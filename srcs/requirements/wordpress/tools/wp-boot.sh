#!/bin/sh

# exit script on any error
set -e

# check if WordPress is already installed
if ! wp --path=/var/www/html/wordpress core is-installed; then
  # run WP-CLI install command
  # administrator user
  wp --path=/var/www/html/wordpress core install --url="${DOMAIN_NAME}" --title="${WP_TITLE}" \
          --admin_user="${WP_OWNER_USER}" --admin_password="${MYSQL_PASSWORD}" --admin_email="${WP_OWNER_EMAIL}"

  # test user
  wp --path=/var/www/html/wordpress user create "${WP_GUEST_USER}" "${WP_GUEST_EMAIL}" \
            --role=author --user_pass="${MYSQL_PASSWORD}"
else
  echo "WordPress is already installed."
fi

exec php-fpm82 -F
