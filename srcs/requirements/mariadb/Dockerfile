FROM alpine:3.19.2

RUN apk update && apk upgrade --no-cache && \
	# adding main components of MariaDB to system: mariadb-cient and mariadb-server
	apk add --no-cache mysql mysql-client mariadb-server-utils

# these are symlinks
RUN mysql_install_db --user=mysql --ldata=/var/lib/mysql

EXPOSE 3306

# Use a script to customize database setup, then start mariadbd-safe
COPY docker-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-entrypoint.sh
ENTRYPOINT ["docker-entrypoint.sh"]

CMD ["mariadbd-safe"]


########## TESTING ##########

# docker container run --name mariadb_test --network srcs_app-network -it alpine:3.19.2 sh

# SHOW DATABASES;

# DROP DATABASE IF EXISTS test_db;
# CREATE DATABASE test_db CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

# CREATE USER 'test_user'@'%' IDENTIFIED BY 'test_pw';
# GRANT ALL PRIVILEGES ON test_db.* TO 'test_user'@'%';
# FLUSH PRIVILEGES;
