ARG CONTAINER_VERSION=${CONTAINER_VERSION}
FROM php:${CONTAINER_VERSION}-fpm-alpine
# busybox-extras telnet <ip> <port>
RUN apk --update --no-cache add build-base \
  busybox-extras \
  $PHPIZE_DEPS \
  libtool \
  imagemagick \
  libjpeg-turbo-dev \
  imagemagick-dev \
  libxml2-dev \
  libmcrypt-dev \
  freetype \
  file \
  libzip-dev \
  libpng \
  icu-dev \
  g++ \
  freetype-dev \
  libpng-dev \
  zip \
  jpegoptim \
  pngquant \
  gifsicle \
  && pecl install imagick redis \
  && export CFLAGS="$PHP_CFLAGS" CPPFLAGS="$PHP_CPPFLAGS" LDFLAGS="$PHP_LDFLAGS"

ARG PHP_EXTENSION=false

RUN /usr/local/bin/docker-php-ext-install ${PHP_EXTENSION}

RUN  /usr/local/bin/docker-php-ext-configure intl && \
    /usr/local/bin/docker-php-ext-install intl

ARG PECL_EXTENSION=false

RUN /usr/local/bin/docker-php-ext-install iconv && \
 /usr/local/bin/docker-php-ext-configure gd --with-freetype=/usr/include/ --with-jpeg=/usr/include/ && \
/usr/local/bin/docker-php-ext-install gd && \
/usr/local/bin/docker-php-ext-enable imagick redis

RUN apk del --no-cache freetype-dev libpng-dev && \
rm -rf /tmp/pear

COPY --from=composer:1.8.5 /usr/bin/composer /usr/bin/composer

RUN addgroup -g 1000 -S appuser && \
    adduser -u 1000 -S appuser -G appuser

RUN apk --update --no-cache add git npm yarn

USER appuser

WORKDIR /var/www/html
CMD [ "sh" ]