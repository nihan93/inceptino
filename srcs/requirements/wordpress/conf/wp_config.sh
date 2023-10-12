#!/bin/bash

sleep 10


if [[ "$WP_USER" =~ (admin|Admin|administrator|Administrator) ]]; then
    echo "Error: Variable contains a disallowed value."
    exit 1
fi

if [ ! -f '/var/www/wordpress/wp-config.php' ]; then
    wp config create	--allow-root \
        --dbname=$SQL_DB_NAME\
        --dbuser=$SQL_USER_NAME \
        --dbpass=$SQL_USER_PASS \
        --dbhost=mariadb:3306 --path='/var/www/wordpress'
fi

if ! wp core is-installed --allow-root; then
    wp core install --allow-root --url=$DOMAIN_NAME --title=nbarakat  --admin_user=$WP_USER \
        --admin_password=$WP_PASS --admin_email=$WP_EMAIL 
fi

if ! wp user list --allow-root --field=user_login | grep -q "^$W_USER$"; then
    wp user create --allow-root $W_USER $W_EMAIL --user_pass=$W_PASS
else
    echo "User $W_USER already exists. Skipping user creation."
fi
exec $@
