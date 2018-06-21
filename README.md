As this project's name suggests, this is yet another dockerized PHP development environment. I build this only to aid my own development purpose, so it's rather a very simple and basic one. But it might help those who are satisfied by these things:

- ~~Dev in Mac (or NOT)~~

    There is a script that will use docker's special DNS name `host.docker.internal`( see <https://docs.docker.com/docker-for-mac/networking/>), according to the doc, this DNS name might only be available in Docker for Mac, so this might or might not be a requirment...

    Update: confirmed from <https://docs.docker.com/docker-for-windows/networking/>, Windows docker also has the `host.docker.internal` DNS name. So this is no longer a requirment. :)

- Use PHP5.6

And these are what provided by this environment:

- A LNMP development enviroment with redis(apparently)
- Multiple virtual domain support
- View sites' logs in host machine
- And XDebug (I actually put lots of effort to get this work)

# Setting up sites

There is a demo-site included in this project, to guide you set up your sites. It's actually simple:

1. Firstly, put your site project folder under `www/`
2. Secondly, add an virtual host config under `conf/nginx/conf.d/`, you can just copy `demo-site.conf` and do a few tweeks to save some time.
3. Then, don't forget to add an entry into your system's `host` file!

Done. Your sites are all set.

# Using XDebug
I won't go into detail of setting up XDebug, But basicaly, It follows these steps:

1. install and configure XDebug into your sites server (Done for you)
    
2. install and configure your IDE/Editor.

    There are two things worth noting: 
    - The idekey should be `xdbg` the same as set in  `xdebug.ini` file
    - You MUST set your `path_mapping` correctly
    - And `port` to `9000`

    I'm using Sublime Text with its pacakge Xdebug Client, and the setting is something like:

    ```json
    "path_mapping": {
        "/var/www/html/": "/Users/me/Projects/",
        "/var/www/html/": "/Users/me/Sites/",
    },
    "ide_key": "xdbg",
    "port": 9000,
    ```

3. Install the browser's plugin, enable debug and start debugging.

# Build & Run

Finally, run `docker-compose build` and `docker-compose run` to bring it alive.
