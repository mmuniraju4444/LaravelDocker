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

COPY --from=composer:2.2.21 /usr/bin/composer /usr/bin/composer

RUN addgroup -g 1001 -S appuser && \
    adduser -u 1001 -S appuser -G appuser

RUN apk --update --no-cache add git npm yarn

#Metric
#COPY --from=telegraf:1.26.2-alpine /usr/bin/telegraf /usr/bin/telegraf
#COPY telegraf.conf /etc/telegraf/telegraf.conf
#RUN sed -i '/bin\/sh/a if [ $(pidof telegraf | wc -w) -eq 0 ]; then (nohup telegraf --quiet &) fi'  /usr/local/bin/docker-php-entrypoint

USER appuser

WORKDIR /var/www/html
CMD [ "sh" ]