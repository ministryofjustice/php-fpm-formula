{% from "php-fpm/map.jinja" import php_fpm with context %}

include:
  - repos

php-pear:
  pkg.installed

xhprof:
  pecl.installed:
    - name: xhprof-beta
    - require:
      - pkg: php-pear
