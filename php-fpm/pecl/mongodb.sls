{% from "php-fpm/map.jinja" import php_fpm with context %}

include:
  - repos
  - php-fpm.pecl

pecl-install-mongo:
  pecl.installed:
    - name: mongo
    - defaults: True
{% if php_fpm.pecl.mongo.version %}
    - version: {{ php_fpm.pecl.mongo.version }}
{% endif %}
