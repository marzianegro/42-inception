#!/bin/sh

if [ ! -d "/run/mysqld" ]; then
	mkdir -p /run/mysqld
	chown -R mysql:mysql /run/mysqld
fi

if [ ! -d "/var/lib/mysql/mysql" ]; then

	chown -R mysql:mysql /var/lib/mysql

	# init database
	mysql_install_db --basedir=/usr --datadir=/var/lib/mysql --user=mysql --rpm > /dev/null

	# secure installation + create db and user
	/usr/bin/mysqld --user=mysql --bootstrap << EOF
USE mysql;

DELETE FROM mysql.global_priv WHERE User='';

DELETE FROM mysql.global_priv
WHERE User='root'
	AND Host NOT IN ('localhost', '127.0.0.1', '::1');

DROP DATABASE IF EXISTS test;
DELETE FROM mysql.db
WHERE Db='test'
	OR Db='test\\_%';

FLUSH PRIVILEGES;



ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PWD';

DROP DATABASE IF EXISTS $WP_DATABASE_NAME;
CREATE DATABASE $WP_DATABASE_NAME CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

CREATE USER '$WP_DATABASE_USR'@'%' IDENTIFIED BY '$WP_DATABASE_PW';
GRANT ALL PRIVILEGES ON $WP_DATABASE_NAME.* TO '$WP_DATABASE_USR'@'%';

FLUSH PRIVILEGES;
EOF

fi

# allow remote connections
sed -i "s|skip-networking|# skip-networking|g" /etc/my.cnf.d/mariadb-server.cnf
sed -i "s|.*bind-address\s*=.*|bind-address=0.0.0.0|g" /etc/my.cnf.d/mariadb-server.cnf

exec /usr/bin/mysqld --user=mysql --console
