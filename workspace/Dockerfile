FROM php:7.2-alpine3.9

###########################################################################
# dockdev non-root user:
###########################################################################

# Add a non-root user to prevent files being created with root permissions on host machine.
ARG PUID=1000
#ENV PUID ${PUID}
ARG PGID=1000
#ENV PGID ${PGID}

USER root
# always run apt update when start and after add new source list, then clean up at end.
RUN addgroup -g ${PGID} -S docker_env && \
    adduser -u ${PUID} -G docker_env -D -H dockdev

###########################################################################
# Composer:
###########################################################################
#RUN apk add php7-mysqli php7-pdo_mysql
RUN curl -sS https://getcomposer.org/installer | php && \
    mv composer.phar /usr/local/bin/composer && \
    chmod u+x /usr/local/bin/composer