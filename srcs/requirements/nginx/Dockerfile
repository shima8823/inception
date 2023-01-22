FROM debian:buster

RUN apt-get update && apt-get install -y --no-install-recommends \
    nginx \
    openssl \
    && rm -rf /var/lib/apt/lists/*

ARG DOMAIN_NAME
ARG CERTS_

RUN openssl req -x509 \
                -nodes \
                -days 365 \
                -subj "/C=JP/ST=NIIGATA/O=42 tokyo/CN=${DOMAIN_NAME}" \
                -newkey rsa:2048 \
                -keyout /etc/ssl/private/nginx-selfsigned.key \
                -out /etc/ssl/certs/${CERTS_}

COPY ./conf/nginx.conf /etc/nginx/sites-available/default

# "daemon off;"とするとフォアグラウンドで起動する
CMD ["nginx", "-g", "daemon off;"]