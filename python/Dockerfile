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
        libuuid \
        pcre \
        mailcap \
        gcc \
        libc-dev \
        linux-headers \
        pcre-dev \
        jpeg-dev zlib-dev \
     && mkdir /root/.pip

#Add pip install mirror:
COPY ./pip.conf /root/.pip/pip.conf

# flask default port
EXPOSE 5000