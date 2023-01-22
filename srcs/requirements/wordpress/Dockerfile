FROM debian:buster

RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    ca-certificates \
    mariadb-client \
    php7.3 \
    php7.3-fpm \
    php7.3-json \
    php7.3-mysqli \
    && rm -rf /var/lib/apt/lists/*

# wp cliのdownload
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf

RUN mkdir /run/php

COPY ./tools/docker-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

ENTRYPOINT ["docker-entrypoint.sh"]