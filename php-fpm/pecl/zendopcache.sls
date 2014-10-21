{% from "php-fpm/map.jinja" import php_fpm with context %}

include:
  - repos

pecl-install-zendopcache:
  pecl.installed:
    - name: zendopcache
    - defaults: True
{% if php_fpm.pecl.zendopcache.version %}
    - version: {{ php_fpm.pecl.zendopcache.version }}
{% endif %}
