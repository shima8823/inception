FROM debian:buster

RUN apt-get update && \
	apt-get install -y \
	mariadb-server

# 正常に動作するためには、MySQLサーバーがこのディレクトリ内のファイルを読み書きするために必要なアクセス権を持っていることが必要
# RUN mkdir -p /var/run/mysqld \
# 	&& chown -R mysql:mysql /var/run/mysqld

COPY ./tools/docker-entrypoint.sh /usr/local/bin/
COPY ./conf/mariadb.conf /etc/mysql/mariadb.conf.d/50-server.cnf
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

ENTRYPOINT ["docker-entrypoint.sh"]