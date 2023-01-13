FROM debian:buster

RUN apt-get update && \
	apt-get install -y mariadb-server

# COPY conf /etc/mysql/my.cnf

EXPOSE 3306

CMD tail -f /dev/null
# CMD ["mysqld"]

