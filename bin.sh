#!/bin/bash

if [ "mysql" = "$1" ]; then
  docker exec dockdev_mysql_1 bash
elif [ "mysqlimport" = "$1" ]; then
  docker exec dockdev_mysql_1 mysql -uroot -proot $2 < $3
elif [ "mysqldump" = "$1" ]; then
  docker exec dockdev_mysql_1 mysqldump  -uroot -proot $2 > $3
elif [ "nginx" = "$1" ]; then
  docker exec -it dockdev_nginx_1 bash
elif [ "worker" = "$1" ]; then
  docker exec -it dockdev_php-worker_1 bash
else
  echo -e "Help:\n  进入MySQL容器:\n  ./bin.sh mysql\n  导入SQL文件:\n  ./bin.sh mysqlimport 表名 需要导入的SQL文件\n  导出SQL文件:\n  ./bin.sh  mysqldump 表名 导出文件名\n  进入nginx容器:\n  ./bin.sh nginx\n  进入工作台容器:\n  ./bin.sh worker"
fi