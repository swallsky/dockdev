### 删除为<none>的镜像
```
docker images | grep 'none' | awk '{print $3}' | xargs docker rmi -f
```

###  基于 gunicorn 多站点配置，注意修改外内端口，防止冲突
```
docker run -it -v 项目目录:/var/www/website -p 8080:5000  dockdev_gunicorn gunicorn -b 0.0.0.0:5000 main:app
```