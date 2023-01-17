FROM debian:buster

RUN apt-get update && \
	apt-get install -y \
	mariadb-server mariadb-client

RUN mkdir -p /var/run/mysqld \
&& chown -R mysql:mysql /var/run/mysqld \
&& chmod 777 /var/run/mysqld


COPY ./tools/start.sh /usr/local/bin/
COPY ./conf/mariadb.conf /etc/mysql/mariadb.conf.d/50-server.cnf
RUN chmod +x /usr/local/bin/start.sh

EXPOSE 3306

# CMD tail -f /dev/null
ENTRYPOINT ["/usr/local/bin/start.sh"]

# Dockerfileにおいては、Dockerコンテナ内でmysqldデーモンを起動し、クライアンアントからの接続を受け付け、データベースへのアクセスを提供するために使用されます。
CMD ["mysqld_safe"]