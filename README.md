# Docker-Pyspider
搭建一个Pyspider服务，为定时爬虫做准备

首先安装Dockerfile中的pyspider镜像。此Dockerfile可以No module named MySQLdb的问题
`docker build -t binux/pyspider:my .`

执行`docker run --name mysql -p 3307:3306 -d -v /data/mysql:/var/lib/mysql -e MYSQL_ALLOW_EMPTY_PASSWORD=yes mysql:8.0 --default-authentication-plugin=mysql_native_password`构建mysql8.0容器，并设置密码为空，本地3306端口映射到宿主机3307端口。

执行`docker run --name rabbitmq -d rabbitmq:latest` 构建消息队列rabitmq容器

执行`docker exec -it mysql /bin/bash` 进入mysql容器修改root权限为localhost `update user set host = "%" where user = "root";flush privileges; select host,user,plugin from user;`

执行`docker-compose up`构建pyspider容器


如果docker-compose安装失败或者运行出错，可以使用二进制安装，代码如下``sudo curl -L https://github.com/docker/compose/releases/download/1.17.1/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose``