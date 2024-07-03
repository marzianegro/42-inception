FROM alpine:3.19.2

# install MariaDB server, client, and utilities without caching
RUN apk add --no-cache mariadb mariadb-client mariadb-server-utils

# create 'mysql' group and user for running MariaDB processes securely
RUN addgroup mysql mysql

# create directory for custom scripts (e.g., initialization scripts)
RUN mkdir /scripts

# prepare MariaDB runtime directory and ensure proper permissions for 'mysql' user
RUN mkdir -p /run/mysqld \
	&& chown -R mysql:mysql /run/mysqld /scripts

# REVIEW: help pt. 1
# Copy or create your custom MariaDB configuration file if needed
# COPY my.cnf /etc/mysql/my.cnf

# REVIEW: help pt. 2
# You can place initialization scripts in /docker-entrypoint-initdb.d
# COPY ./scripts/ /docker-entrypoint-initdb.d/

EXPOSE 3306

# REVIEW: help pt. 3
# Initialize the database and run the MariaDB server
# The entrypoint script can handle initialization and other tasks
COPY docker-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-entrypoint.sh
ENTRYPOINT ["docker-entrypoint.sh"]

CMD ["mysqld"]
