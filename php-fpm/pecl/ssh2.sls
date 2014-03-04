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
  cmd:
    - run
    - unless: /usr/local/bin/pecl list | grep ssh
    - name: echo | /usr/local/bin/pecl install ssh2 channel://pecl.php.net/ssh2-0.12
