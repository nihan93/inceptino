FROM debian:11

RUN apt update && apt upgrade -y \
    && apt install nginx openssl -y && apt clean


ARG  CERTIF_PATH
ARG  KEY_PATH

COPY  $CERTIF_PATH /etc/ssl/certificate.crt

COPY  $KEY_PATH  /etc/ssl/private.key
RUN mkdir -p /var/run/nginx         
COPY  ./conf/default.conf /etc/nginx/sites-enabled
RUN chmod 755 /var/www/html

RUN chown -R www-data:www-data /var/www/html

CMD [ "nginx", "-g", "daemon off;"]