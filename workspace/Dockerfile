FROM php:7.2-alpine3.9

USER root

# CHANGE SOURCE && apk upgrade
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/' /etc/apk/repositories \
    && apk update \
    && apk upgrade \
    && apk add --no-cache openssl \
    && apk add --no-cache bash
# add a non-root user dockdev
RUN addgroup -g 1000 docker_env \
    && adduser -u 1000 -G docker_env -D -H dockdev

# Composer install
RUN curl -sS https://getcomposer.org/installer | php \
    && mv composer.phar /usr/local/bin/composer \
    && chmod u+x /usr/local/bin/composer

# node.js npm install
RUN apk add nodejs && \
    apk add npm && \
    npm config set registry https://registry.npm.taobao.org