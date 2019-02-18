ARG PHP_VERSION=${PHP_VERSION}
FROM php:${PHP_VERSION}-alpine

USER root

# CHANGE SOURCE && apk upgrade
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/' /etc/apk/repositories \
    && apk update \
    && apk upgrade \
    && apk add --no-cache openssl \
    && apk add --no-cache bash \
    && apk add git \
    && apk add supervisor \
    && docker-php-ext-install mysqli pdo pdo_mysql zip
# add a non-root user dockdev
RUN addgroup -g 1000 docker_env \
    && adduser -u 1000 -G docker_env -D -H dockdev

# Composer install
RUN curl -sS http://getcomposer.org/installer | php \
    && mv composer.phar /usr/local/bin/composer \
    && chmod u+x /usr/local/bin/composer \
    && composer config -g repo.packagist composer https://packagist.phpcomposer.com

RUN rm /var/cache/apk/* \
    && mkdir -p /var/www


COPY supervisord.conf /etc/supervisord.conf

ENTRYPOINT ["/usr/bin/supervisord", "-n", "-c",  "/etc/supervisord.conf"]
#
#--------------------------------------------------------------------------
# Check PHP version
#--------------------------------------------------------------------------
#

RUN php -v | head -n 1 | grep -q "PHP ${PHP_VERSION}."

#
#--------------------------------------------------------------------------
# Final Touch
#--------------------------------------------------------------------------
#

WORKDIR /etc/supervisor/conf.d/