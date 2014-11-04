{% from "php-fpm/map.jinja" import php_fpm with context %}

include:
  - repos

pecl-install-intl:
  cmd:
    - run
    - unless: /usr/local/bin/pecl list | grep intl
    - name: echo | /usr/local/bin/pecl install intl channel://pecl.php.net/intl-3.0.0
