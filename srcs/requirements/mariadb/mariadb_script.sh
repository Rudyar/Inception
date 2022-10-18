#!/bin/bash

# A virer !!!!
DB_ROOT_USER=root_user
DB_ROOT_PASSWORD=root_password
DB_USER=db_user
DB_USER_PASSWORD=password
DB_NAME=wordpress
DB_HOST=mariadb
DB_MAIL=arudy@student.42.fr
DOMAIN_NAME=arudy.42.fr

echo "CONFIGURING DATABASE"
touch file
chmod 755 file
mysql_install_db 2> /dev/null

cat << EOF > file
CREATE DATABASE $DB_NAME;
FLUSH PRIVILEGES;
GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' IDENTIFIED BY '$DB_ROOT_PASSWORD' WITH GRANT OPTION;
FLUSH PRIVILEGES;
CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_USER_PASSWORD';
GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%';
FLUSH PRIVILEGES;
EOF

echo "1===================="
mysqld --user=mysql --bootstrap < file
rm file
echo "2===================="
exec mysqld
