ARG PHP_VERSION=${PHP_VERSION}
FROM php:${PHP_VERSION}-alpine

USER root

# CHANGE SOURCE && apk upgrade
#RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/' /etc/apk/repositories \
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories \
    && apk update \
    && apk upgrade \
    && apk add --no-cache openssl \
    && apk add --no-cache bash \
    && apk add git \
    && apk add supervisor \
    && docker-php-ext-install mysqli pdo pdo_mysql

# Install the PHP gd zip pdo_mysql extention
RUN apk add --no-cache freetype libpng libjpeg-turbo freetype-dev libpng-dev libjpeg-turbo-dev \
    && docker-php-ext-configure gd \
        --with-gd \
        --with-freetype-dir=/usr/include/ \
        --with-png-dir=/usr/include/ \
        --with-jpeg-dir=/usr/include/ \
    && NPROC=$(grep -c ^processor /proc/cpuinfo 2>/dev/null || 1) \
    && docker-php-ext-install -j${NPROC} gd \
    && docker-php-ext-install pdo_mysql zip \
    && apk del --no-cache freetype-dev libpng-dev libjpeg-turbo-dev

# 安装redis扩展
RUN curl -L -o /tmp/redis.tar.gz https://github.com/phpredis/phpredis/archive/3.1.6.tar.gz \
    && tar xfz /tmp/redis.tar.gz \
    && rm -r /tmp/redis.tar.gz \
    && mkdir -p /usr/src/php/ext \
    && mv phpredis-3.1.6 /usr/src/php/ext/redis \
    && docker-php-ext-install redis \
    # 如果这段不加构建的镜像将大100M,删除源代码文件
    && rm -rf /usr/src/php

# add a non-root user dockdev
RUN addgroup -g 1000 docker_env \
    && adduser -u 1000 -G docker_env -D -H dockdev

ADD ./composer /usr/local/bin/composer

# Composer install
#RUN curl -sS http://getcomposer.org/installer | php \
#    && mv composer.phar /usr/local/bin/composer \
RUN chmod u+x /usr/local/bin/composer \
    && composer config -g repo.packagist composer https://mirrors.aliyun.com/composer/

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