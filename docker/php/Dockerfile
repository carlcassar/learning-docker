FROM php:7.3.12-fpm-alpine

LABEL maintainer="Carl Cassar"

COPY ./install.sh install.sh
RUN chmod +x install.sh && ./install.sh

# Expose the php-fpm port
EXPOSE 9000

# Add config files
ADD config/php-fpm.conf /etc/php/7.3/fpm/php-fpm.conf
ADD config/www.conf /etc/php/7.3/fpm/pool.d/www.conf

# Run php-fpm
CMD ["php-fpm"]