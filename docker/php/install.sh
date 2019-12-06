#!/bin/bash

# Update package lists
apt-get update

# Install basic command line tools
apt-get install -y \
    curl \
    zip \
    unzip \
    git \
    software-properties-common

# Add the ondrej/php repository to install php.
add-apt-repository -y ppa:ondrej/php

# Update package lists
apt-get update

# Install php modules
apt-get install -y \
    php7.3-fpm \
    php7.3-cli \
    php7.3-gd \
    php7.3-mysql \
    php7.3-imap \
    php7.3-json \
    php7.3-mbstring \
    php7.3-xml \
    php7.3-curl \
    php7.3-bcmath \
    php-memcached \

# Install Composer
php -r "readfile('http://getcomposer.org/installer');" | php -- --install-dir=/usr/bin/ --filename=composer

# Add php run file for php-fpm
mkdir /run/php

# Clean up
apt-get remove -y --purge software-properties-common
apt-get clean
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
