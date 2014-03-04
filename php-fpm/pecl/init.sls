{% from "php-fpm/map.jinja" import php_fpm with context %}

{#
set_default_pear_ini:
  cmd:
    - run
    - name: /usr/local/bin/pear config-set php_ini /usr/local/lib/php.ini

set_default_pecl_ini:
  cmd:
    - run
    - name: /usr/local/bin/pecl config-set php_ini /usr/local/lib/php.ini

set_default_pecl_bin:
  cmd:
    - run
    - name:  /usr/local/bin/pecl config-set php_bin /usr/local/bin/php

#}
