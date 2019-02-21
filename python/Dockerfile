# https://github.com/tiangolo/uwsgi-nginx-docker/tree/master/python3.6-alpine3.8
ARG PYTHON_VERSION=3.6.8
FROM python:${PYTHON_VERSION}-alpine3.9

USER root

# CHANGE SOURCE && apk upgrade
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/' /etc/apk/repositories \
    && apk update \
    && apk upgrade \
    && apk add --no-cache openssl \
    && apk add --no-cache bash \
    && apk add \
        gcc \
        libc-dev \
        make \
        openssl-dev \
        pcre-dev \
        zlib-dev \
        linux-headers \
		curl \
		gnupg1 \
		libxslt-dev \
		gd-dev \
		geoip-dev \
        libuuid \
#        pcre \
        mailcap \
        jpeg-dev \
     && mkdir /root/.pip
#     && adduser -D -H -u 1000 -s /bin/bash uwsgi-data

# Add pip install mirror:
COPY ./pip.conf /root/.pip/pip.conf
COPY ./require.txt /root/require.txt

# Install uWSGI
RUN apk add --no-cache uwsgi-python3 \
    && pip install -r /root/require.txt

WORKDIR /var/www/python/sscmspy

CMD ["./artisan","runserver"]

EXPOSE 5000