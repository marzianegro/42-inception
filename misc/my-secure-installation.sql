/*
	NOTES: Configuration

	In order to help with the basic configuration of the database engine, MariaDB provides mysql_secure_installation.
	This script walks you through the basics of securing the database. The options are explained below.

	1. Enter current password for root (enter for none):
		If you have previously set up a root password, provide it here and press enter. If not, just press enter.
	2. Switch to unix_socket authentication [Y/n]
		Setting the root password or using the Unix_socket ensures that only admins can log into engine database.
		For non-production servers just press "n" to setup a root password, which will give you the response ... skipping.
	3. Change the root password? [Y/n]
		Here you can change the root password, or set one if needed. Press "Y" and enter the new password.
*/ 

/*
	4. Remove anonymous users? [Y/n]
		Remove anonymous users created to log in using socket authentication. Unless you're sure you need
		this, answer "Y" to remove them.
*/
DELETE FROM mysql.global_priv WHERE User='';

/*
	5. Disallow root login remotely? [Y/n]
		Normally, root should only be allowed to connect from 'localhost' in order to protect from
		password sniffing attempts over the network. Answer "Y".
*/
DELETE FROM mysql.global_priv
WHERE User='root'
	AND Host NOT IN ('localhost', '127.0.0.1', '::1');

/*
	6. Remove test database and access to it? [Y/n]
		By default, MariaDB comes with a database named 'test' that anyone can access.
		If this is not needed, answer "Y".
*/
DROP DATABASE IF EXISTS test;
DELETE FROM mysql.db
WHERE Db='test'
	OR Db='test\\_%';

/*
	7. Reload privilege tables now? [Y/n]
		Reloading the privilege tables will ensure that all changes made so far will
		take effect immediately. Answer "Y".
*/
FLUSH PRIVILEGES;
