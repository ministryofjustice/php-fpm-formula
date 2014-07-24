{% from "php-fpm/map.jinja" import php_fpm with context %}
{% from 'supervisor/lib.sls' import supervise with context %}

{% macro php_fpm_supervised_pool(pool_name, logship=False) %}
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


# Ensure our php-fpm scripts directory exists.
/srv/scripts/php-fpm:
  file.directory:
    - user: root
    - group: root
    - mode: 755
    - makedirs: True

# Create a start bash script for each service in the pool.
/srv/scripts/php-fpm/start-{{pool_name}}.sh:
  file:
    - managed
    - source: salt://php-fpm/templates/start.sh
    - user: root
    - group: root
    - mode: 744
    - template: jinja
    - context:
      pool_name: {{ pool_name }}

# Call the bash script created above to start php-fpm.
{{ supervise(pool_name,
             cmd="/srv/scripts/php-fpm/start-" + pool_name + ".sh",
             user='root',
             supervise=True,
             working_dir="/",
             log_dir="/var/log/" + pool_name,
             logship=logship
             ) }}


{% if logship %}
{% from "logstash/lib.sls" import logship with context %}
{{ logship(pool_name+'-php-fpm-master.log', '/var/log/'+pool_name+'/php-fpm-master.log', 'php-fpm', ['php-fpm', pool_name, 'master'], 'json') }}
{{ logship(pool_name+'-php-fpm-error.log', '/var/log/'+pool_name+'/php-fpm-error.log', 'php-fpm', ['php-fpm', pool_name, 'error'], 'json') }}
{% endif %}


{% endmacro %}
