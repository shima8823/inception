#!/bin/bash

if [ ! -d "/var/lib/mysql/$MYSQL_DATABASE" ]; then 
	mysql_install_db
	mysqld --bootstrap << EOF
		FLUSH PRIVILEGES;
		ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';
		CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;
		CREATE USER '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';
		GRANT ALL PRIVILEGES ON *.* TO '$MYSQL_USER'@'%';
EOF
fi

# mysqldデーモンを起動し、クライアンアントからの接続を受け付け、データベースへのアクセスを提供
mysqld_safe