#!/bin/bash

# add mysql
# until mysqlcheck -A | grep ${DB_NAME} ; do
# 	echo "J'attend\n"
# 	echo "J'attend\n"
# 	echo "J'attend\n"
# 	echo "J'attend\n"
# 	echo "J'attend\n"
# 	sleep 10
# done
sleep 10
echo "===========\n"
mysqlcheck -A | grep ${DB_NAME}
echo "===========\n"
sleep 10

wp core download --allow-root

wp config create --dbname="$DB_NAME" --dbuser="$DB_ROOT_USER" --dbpass="$DB_ROOT_PASSWORD" --dbhost="$DB_HOST:3306"  --allow-root

wp core install --url="$DOMAIN_NAME" --title="arudy inception" --admin_user="$DB_ROOT_USER" --admin_password="$DB_ROOT_PASSWORD"\
	--admin_email="$DB_MAIL" --skip_email --allow-root

# create user

# Launch wp
php-fpm7.3 -F -R
