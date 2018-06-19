#!/bin/sh
apt-get install -y vim net-tools procps

# determin xdebug.remote_host
xdebug_ini="/usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini"
sed -i '/xdebug.remote_host/d' $xdebug_ini
host_gateway=`getent hosts host.docker.internal | awk '{ print $1 }'`
echo "xdebug.remote_host=$host_gateway" >> $xdebug_ini

# run php-fpm
php-fpm