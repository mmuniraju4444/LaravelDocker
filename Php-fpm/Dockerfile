ARG CONTAINER_VERSION=${CONTAINER_VERSION}
FROM php:${CONTAINER_VERSION}-fpm-alpine3.7

RUN echo "https://mirror.csclub.uwaterloo.ca/alpine/v3.7/main" > /etc/apk/repositories
RUN echo "https://mirror.csclub.uwaterloo.ca/alpine/v3.7/community" >> /etc/apk/repositories

RUN apk --update add build-base \
  libxml2-dev \
  libmcrypt-dev \
  freetype \
  libjpeg-turbo \
  libpng \
  freetype-dev libpng-dev libjpeg-turbo-dev

ARG PHP_EXTENSION=false
RUN /usr/local/bin/docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
/usr/local/bin/docker-php-ext-install ${PHP_EXTENSION}

RUN apk del --no-cache freetype-dev libpng-dev libjpeg-turbo-dev
RUN rm /var/cache/apk/*