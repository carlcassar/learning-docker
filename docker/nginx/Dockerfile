FROM nginx:alpine

LABEL maintainer="Carl Cassar"

# Add config files
ADD config/default.conf /etc/nginx/conf.d/default.conf

# Simlink logs to standard out and standard error
RUN ln -sf /dev/stdout /var/log/nginx/access.log \
    && ln -sf /dev/stderr /var/log/nginx/error.log

# Run nginx
CMD [ "nginx", "-g", "daemon off;" ]