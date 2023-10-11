FROM debian:11

RUN apt-get update && apt-get upgrade -y \
    && apt-get install mariadb-server -y

COPY ./conf/50-server.cnf	/etc/mysql/mariadb.conf.d
COPY ./tools/script.sh /

RUN chmod +x /script.sh 

ENTRYPOINT ["./script.sh"]