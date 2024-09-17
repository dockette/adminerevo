FROM alpine:3.20

LABEL maintainer="Milan Sulc <sulcmil@gmail.com>"

ENV ADMINEREVO_VERSION=4.8.4

RUN echo '@community http://nl.alpinelinux.org/alpine/v3.20/community' >> /etc/apk/repositories && \
    apk --no-cache update && \
    apk --no-cache upgrade && \
    apk add --no-cache \
        tini \
        wget \
        ca-certificates \
        caddy \
        php83-session@community \
        php83-mysqli@community \
        php83-pgsql@community \
        php83-json@community \
        php83-fpm@community && \
    wget https://github.com/adminerevo/adminerevo/releases/download/v${ADMINEREVO_VERSION}/adminer-${ADMINEREVO_VERSION}.php -O /srv/index.php && \
    adduser -D -u 1000 -h /srv -G www-data -g www-data www-data

COPY ./Caddyfile /srv/
COPY ./php-fpm.conf /srv/php-fpm.conf
COPY --chmod=777 ./entrypoint.sh /entrypoint.sh

WORKDIR /srv
EXPOSE 8080

ENTRYPOINT ["tini", "--"]
CMD ["/entrypoint.sh"]
