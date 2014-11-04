{% from "php-fpm/map.jinja" import php_fpm with context %}

include:
  - repos

pecl-install-xhprof:
  cmd:
    - run
    - unless: /usr/local/bin/pecl list | grep xhprof
    - name:   /usr/bin/printf "\n" | pecl install xhprof-beta