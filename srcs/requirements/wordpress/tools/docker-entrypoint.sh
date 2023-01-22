#!/bin/bash

if ! wp core is-installed --allow-root --path=/var/www/html ; then
	wp core download --allow-root --path=/var/www/html --locale=ja
 
	sleep 5
	wp config create \
		--allow-root \
		--path=/var/www/html \
		--locale=ja \
		--dbname="$MYSQL_DATABASE" \
		--dbuser="$MYSQL_USER" \
		--dbpass="$MYSQL_PASSWORD" \
		--dbhost="$MYSQL_HOST"

	sleep 3
	wp core install \
		--allow-root \
		--path=/var/www/html \
		--locale=ja \
		--url="https://$DOMAIN_NAME" \
		--title="$WP_TITLE" \
		--admin_user="$WP_ADMIN_USER" \
		--admin_password="$WP_ADMIN_PASSWORD" \
		--admin_email="$WP_ADMIN_EMAIL"

	wp user create \
		--allow-root \
		--path=/var/www/html \
		"$WP_USER" \
		"$WP_EMAIL" \
		--user_pass="$WP_PASSWORD" \
		--role=author
fi

# フォアグラウンドで待機する
php-fpm7.3 -F