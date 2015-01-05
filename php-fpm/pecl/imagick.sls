{% from "php-fpm/map.jinja" import php_fpm with context %}

include:
  - repos

pecl-install-imagick:
  pecl.installed:
    - name: imagick
    - defaults: True
{% if php_fpm.pecl.imagick.version %}
    - version: {{ php_fpm.pecl.imagick.version }}
{% endif %}
