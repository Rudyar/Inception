#!/bin/bash
wp core download --allow-root

wp config create --dbname="${MYSQL_DATABASE}" --dbuser="${MYSQL_ROOT_USER}" --dbpass="${MYSQL_ROOT_PASSWORD}" --dbhost="${MYSQL_HOST:3306}"  --allow-root

wp core install --url="arudy.42.fr" --title="arudy inception" --admin_user="${MYSQL_ROOT_USER}" --admin_password="${MYSQL_ROOT_PASSWORD}"\
	--admin_email="arudy@student.42.fr" --skip_email --allow-root

wp config create --dbname="${MYSQL_DATABASE}" --dbuser="${MYSQL_USER}" --dbpass="${MYSQL_PASSWORD}" --allow-root

php-fpm7.3 -F -R
# add mysql
