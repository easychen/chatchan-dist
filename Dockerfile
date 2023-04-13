FROM easychen/ai.level06.com:latest

# 将当前目录下的 build.zip 文件复制到容器 /data 目录下
COPY build.zip /data

# 解压 build.zip 文件
RUN unzip /data/build.zip -d /data/web

VOLUME /data/web

# 替换 /data/api/app.js 文件 中的 app.all(`*` 为 app.use(express.static('/data/web'));app.use(`*`
RUN sed -i 's/app.all(`*`/app.use(express.static(`\/data\/web`));app.use(`*/g' /data/api/app.js
# 替换 if(req.originalUrl) req.url = req.originalUrl;
RUN sed -i 's/const url =/if(req.originalUrl) req.url = req.originalUrl;const url =/g' /data/api/app.js

