#!/bin/sh

# Start mariadb

service mariadb start

# Create database

mysql -u root -p"$passwordRootMariaDB" -e  "\
	CREATE DATABASE IF NOT EXISTS $database; \
	CREATE USER IF NOT EXISTS \`${userMariaDB}\`@'localhost' IDENTIFIED BY '${passwordMariaDB}'; \
	GRANT ALL PRIVILEGES ON \`${database}\`.* TO \`${userMariaDB}\`@'%' IDENTIFIED BY '${passwordMariaDB}'; \
	ALTER USER 'root'@'localhost' IDENTIFIED BY '${passwordRootMariaDB}'; \
	FLUSH PRIVILEGES;"

# Stop mariadb

kill `cat /var/run/mysqld/mysqld.pid`

# Start mariadb again

mysqld