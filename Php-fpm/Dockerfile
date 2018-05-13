ARG CONTAINER_VERSION=${CONTAINER_VERSION}
FROM php:${CONTAINER_VERSION}-fpm-alpine3.7

RUN echo "http://dl-2.alpinelinux.org/alpine/v3.7/main" > /etc/apk/repositories
RUN apk --update add build-base \
  libxml2-dev

ARG PHP_EXTENSION=false
RUN /usr/local/bin/docker-php-ext-install ${PHP_EXTENSION}

RUN rm /var/cache/apk/*