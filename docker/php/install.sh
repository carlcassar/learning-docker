#!/bin/sh

# Install development dependencies
apk add --no-cache --virtual .build-deps \
    $PHPIZE_DEPS \
    curl-dev \
    imagemagick-dev \
    libtool \
    libxml2-dev \
    postgresql-dev \
    sqlite-dev

# Install production dependencies
apk add --no-cache \
    bash \
    curl \
    g++ \
    gcc \
    git \
    imagemagick \
    libc-dev \
    libpng-dev \
    make \
    mysql-client \
    nodejs \
    nodejs-npm \
    yarn \
    openssh-client \
    postgresql-libs \
    rsync \
    zlib-dev \
    libzip-dev \
    sqlite

# Install PECL and PEAR extensions
pecl install \
    imagick \
    xdebug

# Install and enable php extensions
docker-php-ext-enable \
    imagick \
    xdebug

docker-php-ext-configure zip --with-libzip

docker-php-ext-install \
    curl \
    iconv \
    mbstring \
    pdo \
    pdo_mysql \
    pdo_pgsql \
    pdo_sqlite \
    pcntl \
    tokenizer \
    xml \
    gd \
    zip \
    bcmath

# Install composer
export COMPOSER_HOME=/composer
export PATH=./vendor/bin:/composer/vendor/bin:$PATH
export COMPOSER_ALLOW_SUPERUSER=1
curl -s https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin/ --filename=composer
