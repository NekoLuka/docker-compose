FROM trafex/php-nginx:latest

USER root

RUN apk update && apk add php81-pdo_mysql && \
    wget -O /var/www/chyrp.tar.gz https://github.com/xenocrat/chyrp-lite/archive/refs/tags/v2023.01.tar.gz && \
    tar -xf /var/www/chyrp.tar.gz -C /var/www && rm -r /var/www/html && \
    rm /var/www/chyrp.tar.gz && \
    mv /var/www/chyrp-lite-2023.01 /var/www/html && \
    chown -R nobody /var/www

USER nobody
