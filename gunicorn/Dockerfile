# https://github.com/tiangolo/uwsgi-nginx-docker/tree/master/python3.6-alpine3.8
ARG PYTHON_VERSION=3.6.8
FROM python:${PYTHON_VERSION}-slim

USER root

# CHANGE SOURCE && apk upgrade
RUN mkdir /root/.pip
#     && adduser -D -H -u 1000 -s /bin/bash uwsgi-data

# Add pip install mirror:
COPY ./pip.conf /root/.pip/pip.conf
COPY ./cms.txt /root/cms.txt
COPY ./sources.list /etc/apt/sources.list
COPY node-v10.15.3-linux-x64/ /var/node/

RUN ln -s /var/node/bin/node /usr/bin/node \
    && ln -s /var/node/bin/npm /usr/bin/npm \
    && npm config set registry https://registry.npm.taobao.org \
    && npm install -g pm2
# Install gunicorn
#RUN cd /opt \
#    && tar zxvf node-v10.15.3-linux-x64.tar.xz \
#    && pip install -r /root/cms.txt
# 容器启动时 启动
#ENTRYPOINT ["/bin/bash", "/opt/sites/startup.sh"]
#CMD ["gunicorn","-b 0.0.0.0:5000","main:app"]
#ENTRYPOINT [""]


EXPOSE 5000