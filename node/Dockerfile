ARG NODE_VERSION=10.15.1
FROM node:${NODE_VERSION}-alpine

USER root

# CHANGE SOURCE && apk upgrade
#RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/' /etc/apk/repositories \
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories \
    && apk update \
    && apk upgrade \
    && apk add --no-cache openssl \
    && apk add --no-cache bash \
    && apk add --no-cache git \
    && npm config set registry https://registry.npm.taobao.org

# webhook
ADD ./webhook.js /opt/webhook.js
RUN sed -i 's/\r//g' /opt/webhook.js
CMD ["node", "/opt/webhook.js"]

EXPOSE 9988