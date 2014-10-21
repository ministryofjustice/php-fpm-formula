#!/bin/sh

{% from "php-fpm/map.jinja" import php_fpm with context %}

set -e

# Ensure the php5-fpm directory exists.
mkdir -p /var/run/php5-fpm/

#Ensure the old socket doesn't exist.
rm -f /var/run/php5-fpm/{{ pool_name }}.sock

# Touch the socket and the pid files.
touch /var/run/php5-fpm/{{ pool_name }}.sock
touch /var/run/php5-fpm/php5-fpm-{{ pool_name }}.pid

# Set files to the correct user.
chown {{ php_fpm.pools[pool_name].user }}.{{ php_fpm.pools[pool_name].user }} /var/run/php5-fpm/{{ pool_name }}.sock
chown {{ php_fpm.pools[pool_name].user }}.{{ php_fpm.pools[pool_name].user }} /var/run/php5-fpm/php5-fpm-{{ pool_name }}.pid

# Start PHP-FPM.
exec /usr/local/sbin/php-fpm -F --fpm-config=/etc/php5/fpm/pool.d/{{ pool_name }}.conf
