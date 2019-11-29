FROM alpine:3.10
# 中文配置说明书
# https://github.com/Neilpang/acme.sh/wiki/%E8%AF%B4%E6%98%8E

# CHANGE SOURCE
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/' /etc/apk/repositories

RUN apk update -f \
  && apk --no-cache add -f \
  openssl \
  openssh-client \
  coreutils \
  bind-tools \
  curl \
  socat \
  tzdata \
  oath-toolkit-oathtool \
  tar \
  git \
  && rm -rf /var/cache/apk/*

WORKDIR /root

ADD ./acme.sh-master /root/acme.sh-master

RUN cd acme.sh-master \
    && chmod +x acme.sh \
    && ./acme.sh --install  \
    --home ~/myacme \
    --config-home ~/myacme/data \
    --cert-home  ~/mycerts \
    --accountemail  "my@example.com" \
    --accountkey  ~/myaccount.key \
    --accountconf ~/myaccount.conf \
    && ln -s  ~/myacme/acme.sh  /usr/local/bin/acme.sh \
    && rm -rf ~/acme.sh-master

#RUN curl https://get.acme.sh | sh \
#    && ln -s  /root/.acme.sh/acme.sh  /usr/local/bin/acme.sh