### 使用方法
- 复制env-example为.env文件
- 执行docker-compose build,编译镜像
- 执行docker-compose up -d,运行容器

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