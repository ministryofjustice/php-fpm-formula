{% from "php-fpm/map.jinja" import php_fpm with context %}

include:
  - repos

pecl-install-imagick:
  cmd:
    - run
    - unless: /usr/local/bin/pecl list | grep imagick
    - name:   /usr/bin/printf "\n" | pecl install imagick
