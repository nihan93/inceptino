#!/bin/sh

service mariadb start

sleep 2;

# mariadb -u root -e "GRANT ALL ON *.* TO 'root'@'%' '; FLUSH PRIVILEGES;"

# DELETE FROM mysql.user WHERE User='';
# DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');
# DROP DATABASE IF EXISTS test;
# DELETE FROM mysql.db WHERE Db='test' OR Db='test\\_%';
#ALTER USER 'root'@'localhost' IDENTIFIED BY '$SQL_ROOT_PASS'; 
mariadb -sfu root  <<EOS
CREATE DATABASE IF NOT EXISTS $SQL_DB_NAME;
CREATE USER IF NOT EXISTS '$SQL_USER_NAME'@'%' IDENTIFIED BY '$SQL_USER_PASS';
GRANT ALL PRIVILEGES ON $SQL_DB_NAME.* TO '$SQL_USER_NAME'@'%' IDENTIFIED BY '$SQL_USER_PASS' ;
EOS

mariadb -u root -e "FLUSH PRIVILEGES;"

service mariadb stop

echo "starting mariadbd ===>"

mariadbd


