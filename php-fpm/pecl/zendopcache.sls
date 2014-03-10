{% from "php-fpm/map.jinja" import php_fpm with context %}

include:
  - repos
  - php-fpm.pecl

pecl-install-zendopcache:
  cmd:
    - run
    - unless: /usr/local/bin/pecl list | grep zendopcache
    - name: pecl install ZendOpcache channel://pecl.php.net/ZendOpcache-7.0.3

