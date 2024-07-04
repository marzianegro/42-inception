FROM alpine:3.19.2

RUN apk update && apk upgrade --no-cache && \
	# adding main components of MariaDB to system: mariadb-cient and mariadb-server
	apk add --no-cache mysql mysql-client mariadb-server-utils

EXPOSE 3306

COPY conf/docker-entrypoint.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/docker-entrypoint.sh

ENTRYPOINT ["docker-entrypoint.sh"]
