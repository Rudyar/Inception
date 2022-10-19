#!/bin/bash
wp core download --allow-root

while ! mariadb -h$DB_HOST -u$DB_ADMIN -p$DB_ADMIN_PASSWORD; do
	echo "Waiting to connect to MariaDB"
	sleep 2
done

wp config create --dbname="$DB_NAME" --dbuser="$DB_ADMIN" \
	--dbpass="$DB_ADMIN_PASSWORD" --dbhost="$DB_HOST" --allow-root

wp core install --url="$DOMAIN_NAME" --title="arudy inception" \
	--admin_user="$WP_ADMIN" --admin_password="$WP_ADMIN_PASSWORD"\
	--admin_email="$WP_ADMIN_MAIL" --skip-email --allow-root

wp user create $WP_USER $WP_MAIL --user_pass=$WP_USER_PASSWORD --role=author --allow-root

echo "Wordpress installed and configured with a user"
echo "\nVisit https://arudy.42.fr"

# Launch wp
php-fpm7.3 -F -R

# show user db wp : conect to mariadb container, mysql with db_admin
# show databases, use wordpress, show tables, show columns from wp_users
# select user_login from wp_users
