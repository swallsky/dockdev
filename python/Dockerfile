FROM python:3.6.8-alpine3.9

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
     && mkdir /root/.pip

#Add pip install mirror:
COPY ./pip.conf /root/.pip/pip.conf

# pip add uwsgi flask
#RUN pip install uwsgi flask \
#    && apk del \
#        gcc \
#        libc-dev \
#        linux-headers \
#    && rm -rf /tmp/*