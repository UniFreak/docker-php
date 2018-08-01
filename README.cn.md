正如项目名字所说, 这又是一个 docker 化的 PHP 开发环境. 我创建这个项目纯是为了自己的开发需求, 所以其提供的功能很简单有限. 但是可以满足以下条件的开发需求:

- ~~在 Mac 上开发~~

    这个项目会用到 `host.docker.internal` 这个特殊的 DNS 名, 参见 <<https://docs.docker.com/docker-for-mac/networking/>, 看文档貌似只有 Docker for Mac 才会有, 所以这也许是, 也许不是一个必须条件...

    更新: 从 <https://docs.docker.com/docker-for-windows/networking/> 这里来看, Windows Docker 也有 `host.docker.internal`, 所以你也可以在 Windows 使用这个项目啦. :)

- 使用 PHP5.6

这是本项目提供的功能:

- LNMP 开发环境, 以及 redis
- 在 host 机上通过虚拟域名访问网站
- 在 host 机上查看网站 log
- XDebug (我实际上费了好大劲才搞定)

# 配置网站

项目中包含一个 demo-site 实例, 帮助你配置网站, 实际上很简单:

1. 首先, 把你网站代码放到 `/www` 目录下面
2. 然后, 为你的网站在 `conf/nginx/conf.d/` 下面添加一个虚拟主机的配置, 你可以直接拷贝 `demo-site.conf` 然后做些调整, 好节省点时间.
3. 最后, 别忘了往你的 `host` 文件中添加记录, 映射到 `127.0.0.1`!

完事. 网站算是配置好了

# 使用 XDebug
我不会深入到 XDebug 配置的一般细节, 但基本上是这些:

1. 在网站服务器上安装并配置 XDebug (已经在容器中配好了)
    
2. 为你的 IDE 或编辑器配置 XDebug

    几件事必须注意: 
    - idekey 应该是 `xdbg`, 跟服务器上配的一样
    - 你 **必须** 正确设置 `path_mapping`
    - 指定 `port` 为 `9000`

    我使用 Sublime Text 和它的 Xdebug Client 插件, 配置如下所示:

    ```json
    "path_mapping": {
        "/var/www/html/": "/Users/me/Projects/",
        "/var/www/html/": "/Users/me/Sites/",
    },
    "ide_key": "xdbg",
    "port": 9000,
    ```

3. 安装浏览器插件, 开启 debug 模式

# 构建 & 运行

最后, 运行 `docker-compose build` 以及 `docker-compose up` 来让容器运行吧, 你可以在浏览器中访问 docker 容器中的网站了.
