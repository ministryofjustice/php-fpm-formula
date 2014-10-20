{% from "php-fpm/map.jinja" import php_fpm with context %}

include:
  - repos
  - php-fpm.pecl


pecl-pkg-deps:
  pkg:
    - installed
    - pkgs:
      - autoconf
      - libssh2-1-dev


pecl-install-ssh2:
  pecl.installed:
    - name: ssh2
    - defaults: True
{% if php_fpm.pecl.ssh2.version %}
    - version: {{ php_fpm.pecl.ssh2.version }}
{% endif %}
