#!/bin/bash
wp core download --allow-root

while ! mariadb -h$DB_HOST -u$DB_USER -p$DB_USER_PASSWORD; do
	echo "Waiting to connect to MariaDB"
	sleep 2
done

wp config create --dbname="$DB_NAME" --dbuser="$DB_USER" --dbpass="$DB_USER_PASSWORD" --dbhost="$DB_HOST" --allow-root
wp core install --url="$DOMAIN_NAME" --title="arudy inception" --admin_user="$DB_USER" --admin_password="$DB_USER_PASSWORD"\
	--admin_email="$DB_MAIL" --skip-email --allow-root
# create user

echo "Wordpress installed and configured with a user"

# Launch wp
php-fpm7.3 -F -R
