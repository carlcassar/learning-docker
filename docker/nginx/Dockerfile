FROM ubuntu:18.04

LABEL maintainer="Carl Cassar"

# Run the install script
COPY ./install.sh install.sh
RUN chmod +x install.sh && ./install.sh

# Add config files
ADD config/default /etc/nginx/sites-available/default

# Simlink logs to standard out and standard error
RUN ln -sf /dev/stdout /var/log/nginx/access.log \
    && ln -sf /dev/stderr /var/log/nginx/error.log

# Run nginx
CMD [ "nginx" ]