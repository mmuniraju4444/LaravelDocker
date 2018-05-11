ARG CONTAINER_VERSION=${CONTAINER_VERSION}
FROM php:${CONTAINER_VERSION}-fpm-alpine3.7

RUN apk --no-cache add build-base \
  libmemcached-dev \
  libmcrypt-dev \
  libxml2-dev \
  zlib-dev \
  autoconf \
  cyrus-sasl-dev \
  libgsasl-dev \
  supervisor

ARG PHP_EXTENSION=false
RUN /usr/local/bin/docker-php-ext-install ${PHP_EXTENSION}

COPY supervisord.conf /etc/supervisord.conf

WORKDIR /etc/supervisor/config

ENTRYPOINT ["/usr/bin/supervisord", "-n", "-c",  "/etc/supervisord.conf"]
