### 删除为none的镜像
```
docker images | grep 'none' | awk '{print $3}' | xargs docker rmi -f
```

### 导出当前镜像
```
docker save $(docker-compose images | awk '{print $2}' | grep -v Repository | grep -Ev "^$|[#;]") -o dockdev.tar
```

### 导入当前环境
```
docker load -i dockdev.tar
```

###  基于 gunicorn 多站点配置，注意修改外内端口，防止冲突
```
docker run -it -v 项目目录:/var/www/website -p 8080:5000  dockdev_gunicorn gunicorn -b 0.0.0.0:5000 main:app
```