{% from "php-fpm/map.jinja" import php_fpm with context %}

include:
  - repos

install_php_pear_for_xhprof:
  pkg.installed:
    - name: php-pear

xhprof:
  pecl.installed:
    - name: xhprof-beta
    - require:
      - pkg: php-pear
