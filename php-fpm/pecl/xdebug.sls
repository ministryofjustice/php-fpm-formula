{% from "php-fpm/map.jinja" import php_fpm with context %}

include:
  - repos

xdebug:
  pecl.installed:
    - defaults: 'True'

