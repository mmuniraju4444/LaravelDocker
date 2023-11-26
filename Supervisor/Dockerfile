ARG CONTAINER_VERSION=${CONTAINER_VERSION}
FROM php:${CONTAINER_VERSION}-fpm-alpine

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
  && pecl install redis \
  && export CFLAGS="$PHP_CFLAGS" CPPFLAGS="$PHP_CPPFLAGS" LDFLAGS="$PHP_LDFLAGS"

ARG PHP_EXTENSION=false

RUN /usr/local/bin/docker-php-ext-install ${PHP_EXTENSION}

RUN  /usr/local/bin/docker-php-ext-configure intl && \
    /usr/local/bin/docker-php-ext-install intl zip

ARG PECL_EXTENSION=false

RUN /usr/local/bin/docker-php-ext-configure gd --with-freetype=/usr/include/ --with-jpeg=/usr/include/ && \
 /usr/local/bin/docker-php-ext-configure gd --with-freetype=/usr/include/ --with-jpeg=/usr/include/ && \
/usr/local/bin/docker-php-ext-install gd opcache pdo pdo_mysql fileinfo && \
/usr/local/bin/docker-php-ext-enable redis opcache fileinfo

RUN mkdir -p /usr/src/php/ext/imagick; \
    curl -fsSL https://github.com/Imagick/imagick/archive/refs/tags/3.7.0.tar.gz | tar xvz -C "/usr/src/php/ext/imagick" --strip 1; \
    docker-php-ext-install imagick;

RUN apk del --no-cache freetype-dev libpng-dev && \
rm -rf /tmp/pear

RUN apk --update --no-cache add build-base \
  libmemcached-dev \
  zlib-dev \
  autoconf \
  cyrus-sasl-dev \
  libgsasl-dev \
  supervisor \
  && pecl install apcu \
  && docker-php-ext-enable apcu \
  && pecl clear-cache

COPY supervisord.conf /etc/supervisord.conf

WORKDIR /etc/supervisor/config

#Metric
#COPY --from=telegraf:1.26.2-alpine /usr/bin/telegraf /usr/bin/telegraf
#COPY telegraf.conf /etc/telegraf/telegraf.conf
#COPY docker-php-entrypoint.sh /usr/local/bin/docker-php-entrypoint.sh
#RUN chmod +x /usr/local/bin/docker-php-entrypoint.sh

#ENTRYPOINT ["/usr/local/bin/docker-php-entrypoint.sh"]
ENTRYPOINT ["/usr/bin/supervisord", "-n", "-c",  "/etc/supervisord.conf"]
