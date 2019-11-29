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
  && rm -rf /var/cache/apk/*


RUN curl https://get.acme.sh | sh \
    && ln -s  /root/.acme.sh/acme.sh  /usr/local/bin/acme.sh