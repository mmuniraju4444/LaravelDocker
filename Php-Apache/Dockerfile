ARG CONTAINER_VERSION=8.3

FROM php:${CONTAINER_VERSION}-apache

ENV APACHE_DOCUMENT_ROOT=/var/www/html/public

# Configure Apache to use the new document root
RUN sed -i 's|DocumentRoot /var/www/html|DocumentRoot ${APACHE_DOCUMENT_ROOT}|g' /etc/apache2/sites-available/000-default.conf \
    && sed -i 's|<Directory /var/www/html>|<Directory ${APACHE_DOCUMENT_ROOT}|g' /etc/apache2/apache2.conf

# Update and install system dependencies with all required dev packages
RUN apt-get update && apt-get install -y --no-install-recommends \
    # Essential build tools
    build-essential \
    pkg-config \
    # Image processing
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libpng-dev \
    libwebp-dev \
    libxpm-dev \
    # Compression and archives
    libzip-dev \
    zlib1g-dev \
    # Internationalization
    libicu-dev \
    # XML and XSLT
    libxml2-dev \
    libxslt1-dev \
    # SSL and networking
    libssl-dev \
    libcurl4-openssl-dev \
    # String processing
    libonig-dev \
    # Additional libraries
    libreadline-dev \
    libsqlite3-dev \
    # Tools
    unzip \
    zip \
    curl \
    git

# Configure GD extension with all features
RUN docker-php-ext-configure gd \
    --with-freetype \
    --with-jpeg \
    --with-webp \
    --with-xpm

# Install PHP extensions one group at a time to isolate issues
# Core extensions
RUN docker-php-ext-install -j$(nproc) \
    pdo_mysql \
    mysqli \
    zip \
    bcmath \
    opcache

# Image and text processing extensions
RUN docker-php-ext-install -j$(nproc) \
    gd \
    exif

# Internationalization and XML extensions
RUN docker-php-ext-install -j$(nproc) \
    intl \
    xml \
    soap \
    xsl

# System and utility extensions - install individually to debug
RUN docker-php-ext-install fileinfo
RUN docker-php-ext-install sockets

# These might need additional dependencies
RUN apt-get update && apt-get install -y --no-install-recommends gettext-base \
    && docker-php-ext-install gettext \
    && rm -rf /var/lib/apt/lists/*

# PCNTL might not be available on all systems
RUN docker-php-ext-install pcntl || echo "PCNTL extension failed - skipping (not available on all systems)"

# Install Redis extension via PECL
RUN pecl update-channels \
    && pecl install redis \
    && docker-php-ext-enable redis

# Enable Apache mod_rewrite
RUN a2enmod rewrite \
     && echo "ServerName localhost" >> /etc/apache2/apache2.conf

# Clean up to reduce image size
RUN apt-get purge -y --auto-remove build-essential pkg-config \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /tmp/pear

# Set working directory to Laravel app directory
WORKDIR /var/www/html

# Copy custom php.ini (if available)
COPY ./conf/php.ini /usr/local/etc/php/php.ini

# Expose Apache
EXPOSE 80

#CMD ["apache2-foreground"]
