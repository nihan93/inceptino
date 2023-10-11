#!/bin/bash
# until mysqladmin ping -h mariadb:3306 --silent; do
#     echo 'waiting for mysqld to be connectable...'
    sleep 10
# done
if [ ! -f '/var/www/wordpress/wp-config.php' ]; then
    wp config create	--allow-root \
        --dbname=$SQL_DB_NAME\
        --dbuser=$SQL_USER_NAME \
        --dbpass=$SQL_USER_PASS \
        --dbhost=mariadb:3306 --path='/var/www/wordpress'
fi
if ! wp core is-installed --allow-root; then
    wp core install --allow-root --url=$DOMAIN_NAME --title=bamrouch  --admin_user=$WP_USER \
        --admin_password=$WP_PASS --admin_email=$WP_EMAIL 
fi
exec $@
