#!/bin/sh

service mariadb start

sleep 2;

mariadb -sfu root  <<EOS
CREATE DATABASE IF NOT EXISTS $SQL_DB_NAME;
CREATE USER IF NOT EXISTS '$SQL_USER_NAME'@'%' IDENTIFIED BY '$SQL_USER_PASS';
GRANT ALL PRIVILEGES ON $SQL_DB_NAME.* TO '$SQL_USER_NAME'@'%' IDENTIFIED BY '$SQL_USER_PASS' ;
EOS

mariadb -u root -e "FLUSH PRIVILEGES;"

service mariadb stop

echo "starting mariadbd ===>"

mariadbd


