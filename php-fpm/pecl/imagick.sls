{% from "php-fpm/map.jinja" import php_fpm with context %}

include:
  - repos

imagick:
  pecl.installed
