ARG NODE_VERSION=10.15.1
FROM node:${NODE_VERSION}-alpine

USER root

# CHANGE SOURCE && apk upgrade
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/' /etc/apk/repositories \
    && apk update \
    && apk upgrade \
    && apk add --no-cache openssl \
    && apk add --no-cache bash \
    && npm config set registry https://registry.npm.taobao.org \
    && npm install -g http \
    && npm install -g exec

# webhook
ADD ./webhook.js /opt/webhook.js
RUN sed -i 's/\r//g' /opt/webhook.js
CMD ["node", "/opt/webhook.js"]

EXPOSE 9988