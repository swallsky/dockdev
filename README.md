### 使用方法
- 复制env-example为.env文件
- 执行docker-compose build,编译镜像
- 执行docker-compose up -d,运行容器

###### 定时任务、队列任务配置
- php-worker/supervisord.d/laravel-scheduler.conf.example 定时任务配置样例
- php-worker/supervisord.d/laravel-worker.conf.example 队列配置样例

###### 删除为none的镜像
```
docker images | grep 'none' | awk '{print $3}' | xargs docker rmi -f
```

###### 导出当前镜像
```
docker save $(docker-compose images | awk '{print $2}' | grep -v Repository | grep -Ev "^$|[#;]") -o dockdev.tar
```

###### 导入当前环境
```
docker load -i dockdev.tar
```