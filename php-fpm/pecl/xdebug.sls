{% from "php-fpm/map.jinja" import php_fpm with context %}

include:
  - repos

pecl-install-xdebug:
  cmd:
    - run
    - unless: /usr/local/bin/pecl list | grep xdebug
    - name:   /usr/bin/printf "\n" | pecl install xdebug
