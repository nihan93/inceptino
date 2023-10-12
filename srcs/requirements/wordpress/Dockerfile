FROM debian:11

RUN apt-get update -y && apt-get upgrade -y \
    && apt-get install php7.4 php7.4-fpm php7.4-mysql mariadb-client sendmail wget -y

RUN  wget https://wordpress.org/wordpress-6.3.tar.gz -P /var/www/

WORKDIR /var/www/

RUN tar -xzf wordpress-6.3.tar.gz && rm wordpress-6.3.tar.gz 

RUN chown -R root:root /var/www/wordpress

COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar  

RUN chmod +x wp-cli.phar 

RUN mv wp-cli.phar /usr/local/bin/wp

COPY ./conf/wp_config.sh /var/www/

RUN chmod +x /var/www/wp_config.sh
ENTRYPOINT ["/var/www/wp_config.sh"]

RUN mkdir -p /run/php

CMD ["php-fpm7.4", "-F"]

WORKDIR /var/www/wordpress
