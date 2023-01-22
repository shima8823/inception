FROM debian:buster

RUN apt-get update && \
	apt-get install -y \
	mariadb-server

COPY ./tools/docker-entrypoint.sh /usr/local/bin/
COPY ./conf/mariadb.conf /etc/mysql/mariadb.conf.d/50-server.cnf
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

ENTRYPOINT ["docker-entrypoint.sh"]