FROM ubuntu:18.04

LABEL maintainer="Carl Cassar"

# Set the working directory
WORKDIR /root

# Set environment variables
ENV DEBIAN_FRONTEND = noninteractive
ENV TZ = Europe/London

# Set the timezone
RUN echo "Europe/London" > /etc/timezone

# Run the install script
COPY ./install.sh install.sh
RUN chmod +x install.sh && ./install.sh

# Expose the php-fpm port
EXPOSE 9000

# Add config files
ADD config/php-fpm.conf /etc/php/7.3/fpm/php-fpm.conf
ADD config/www.conf /etc/php/7.3/fpm/pool.d/www.conf

# Run php-fpm
CMD ["php-fpm7.3"]