{% from "php-fpm/map.jinja" import php_fpm with context %}

include:
  - repos
  - php-fpm.pecl

pecl-install-mongo:
  cmd:
    - run
    - unless: /usr/local/bin/pecl list | grep mongo
    - name: yes | /usr/local/bin/pecl install mongo
