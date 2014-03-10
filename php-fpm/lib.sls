{% from "php-fpm/map.jinja" import php_fpm with context %}
{% from 'supervisor/lib.sls' import supervise with context %}

{% macro php_fpm_supervised_pool(pool_name) %}
/etc/php5/fpm/pool.d/{{pool_name}}.conf:
  file:
    - managed
    - source: salt://php-fpm/templates/pool.conf
    - user: root
    - group: root
    - mode: 644
    - template: jinja
    - context:
      pool_name: {{ pool_name }}
    - require:
      - pkg: nginx
      - pkg: php
      - user: {{ php_fpm.pools[pool_name].user }}
    - watch_in:
      - supervisord: supervise-{{pool_name}}


{{ supervise(pool_name,
             cmd="/usr/local/sbin/php-fpm",
	         args="-F --fpm-config=/etc/php5/fpm/pool.d/" + pool_name + ".conf",
             user='root',
             supervise=True,
             working_dir="/",
             log_dir="/var/log/" + pool_name
             ) }}

{% endmacro %}
