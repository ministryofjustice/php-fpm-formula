{% from "php-fpm/map.jinja" import php_fpm with context %}

include:
  - repos.pkgrepo_client
  - php-fpm.pecl

pecl-install-mongo:
  cmd:
    - run
    - unless: /usr/local/bin/pecl list | grep mongo
    - name: /usr/local/bin/pecl install mongo
