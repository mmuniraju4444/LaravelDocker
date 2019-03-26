ARG CONTAINER_VERSION=${CONTAINER_VERSION}
FROM php:${CONTAINER_VERSION}-fpm-alpine3.7

COPY --from=composer:1.6.5 /usr/bin/composer /usr/bin/composer

RUN echo "https://mirror.csclub.uwaterloo.ca/alpine/v3.7/main" > /etc/apk/repositories && \
 echo "https://mirror.csclub.uwaterloo.ca/alpine/v3.7/community" >> /etc/apk/repositories

RUN apk --update add build-base \
  libxml2-dev \
  libmcrypt-dev \
  freetype \
  libjpeg-turbo \
  libpng \
  icu-dev \
  g++ \
  freetype-dev libpng-dev libjpeg-turbo-dev && \
  rm /var/cache/apk/*

ARG PHP_EXTENSION=false
RUN /usr/local/bin/docker-php-ext-install ${PHP_EXTENSION}

RUN  /usr/local/bin/docker-php-ext-configure intl && \
    /usr/local/bin/docker-php-ext-install intl

RUN /usr/local/bin/docker-php-ext-install iconv && \
 /usr/local/bin/docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ && \
/usr/local/bin/docker-php-ext-install gd

RUN apk del --no-cache freetype-dev libpng-dev libjpeg-turbo-dev

WORKDIR /var/www/html
CMD [ "sh" ]