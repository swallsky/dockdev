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

# Install gunicorn
RUN pip install gunicorn \
    && pip install -r /root/cms.txt

# 容器启动时 启动
WORKDIR /var/www/website
CMD ["gunicorn","-b 0.0.0.0:5000","main:app"]
EXPOSE 5000