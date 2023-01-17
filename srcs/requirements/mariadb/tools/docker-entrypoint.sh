#!/bin/bash

# ディレクトリであれば真
if [ -d "/var/lib/mysql/$MYSQL_DATABASE" ]
then 
	echo "Database already exists"
else
	mysql_install_db
	mysqld -u mysql --bootstrap << EOF
		CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;
		CREATE USER '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';
		GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';
		ALTER USER root@localhost IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';
		FLUSH PRIVILEGES;
EOF
fi