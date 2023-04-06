FROM node:latest

# 将当前目录下的 build.zip 文件复制到容器 /data 目录下
COPY build.zip /data/

# 解压 build.zip 文件
RUN unzip /data/build.zip -d /data/

# 安装 http-server 模块
RUN npm install -g http-server

# 设置工作目录
WORKDIR /data

# 启动 http 服务指向 /data 目录，端口默认为 9000
CMD ["http-server", "-p", "9000"]