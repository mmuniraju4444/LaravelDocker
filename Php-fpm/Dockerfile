ARG CONTAINER_VERSION=${CONTAINER_VERSION}
FROM php:${CONTAINER_VERSION}-fpm-alpine3.7

RUN apk --no-cache add build-base \
  libxml2-dev 

ARG PHP_EXTENSION=false
RUN /usr/local/bin/docker-php-ext-install ${PHP_EXTENSION}
