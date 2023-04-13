# Chat酱独立部署版

## 默认界面

![](images/20230404174420.png)

## 最近更新

v1.0.6 

- 支持添加常用提示词、点击后会自动填入输入框
- 独立部署版支持设置默认的账号、模型参数、和聊天助手信息

### 常用提示词、点击后会自动填入输入框

![](images/20230413115647.png)

### 独立部署版，支持设置默认账号、模型参数、和聊天助手信息

解压 build.zip 后，编辑目录下的 `default.json` 文件，修改对应项内容后保存即可。

```json
{
    "app_name": "",
    "api_key": "",
    "api_url": "",
    "chat_model": "",
    "chat_max_tokens": "",
    "chat_temperature": "",
    "chat_timeout": "",
    "chat_system_prompt": "",
    "chat_user_prompt": "",
    "chat_character_url": "",
    "chat_character_opacity": 80
}
```
每一项的意义如下：

- "app_name": 应用程序名称，用于标识该客户端的名称。
- "api_key": OpenAI/Api2d Key。
- "api_url": API的URL地址，OpenAI的是 https://api.openai.com ; Api2d的是 https://openai.api2d.net 。
- "chat_model": GPT模型的名称，`gpt-3.5-turbo` 或者 `gpt-4` 。
- "chat_max_tokens": 每个聊天回复的最大标记数。
- "chat_temperature": 用于控制生成回复的随机性的温度值。
- "chat_timeout": 聊天接口超时时间，单位为秒。
- "chat_system_prompt": 系统提示，用于指定系统生成的聊天开始语。
- "chat_user_prompt": 用户提示，用于指定用户输入的聊天开始语。
- "chat_character_url": 聊天角色的URL地址，用于指定聊天时显示的角色图片。
- "chat_character_opacity": 聊天角色的不透明度，用于指定聊天时显示的角色图片的透明度。


v1.0.5 

![](images/20230408130332.png)

- 支持上传和下载对话记录
- 支持重新生成答案
- Docker版自带OpenAI代理，请把自定义地址填为 `http://你的IP:你的端口`，然后请求会从服务器端发送到`api.openai.com`。（请确保Docker部署的环境可以访问api.openai.com）

代理支持访问密码、内容安全、超时设置等，[请点击这里查看详细的环境变量](https://github.com/easychen/openai-api-proxy)


v1.0.2 

- 支持自动保存对话，支持总结对话标题

![](images/20230404174121.png)

- 支持自定义背景

![](images/20230404174028.png)


Chat酱网页版（[c.level06.com](https://c.level06.com)）部署在海外服务器，有部分同学访问不了，因此提供一个独立部署版，你可以将它部署到任何服务器，甚至在电脑直接用支持浏览本地网页的浏览器打开使用。

## 使用方法

1. 下载 [build.zip](./build.zip) 
1. 解压后，你会得到一个完整的网站，访问 index.html 即可使用，如果你的浏览器不支持查看本地网页，那么可以下载我打包这些网页的桌面客户端（ 链接：https://share.weiyun.com/jXtYKbZS 密码：chatok ）
1. 如果要给其他同学使用，可以把这个目录部署到服务器上，然后访问对应目录就行。

## Docker版

虽然我觉得静态网页更简单，但有同学表示想要docker版，于是我让GPT写了个Dockerfile，于是就有了docker版。

使用方法：

不设置默认信息：

```bash
docker run -d -p 9000:9000 easychen/chatchan:latest
```

设置默认信息，首先要保证运行命令的目录下存在 `default.json`：
```bash
docker run -d -p 9000:9000 -v $(pwd)/default.json:/data/web/default.json easychen/chatchan:latest
```

对话截图：

![](images/20230406173224.png)

