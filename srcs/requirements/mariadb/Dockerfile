FROM alpine:3.19.2

# adding main components of MariaDB to system: mariadb-cient and mariadb-server
RUN apk update && apk add --no-cache \
	mysql mysql-client mariadb-server-utils

EXPOSE 3306

COPY tools/mariadb-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/mariadb-entrypoint.sh

ENTRYPOINT ["/usr/local/bin/mariadb-entrypoint.sh"]
