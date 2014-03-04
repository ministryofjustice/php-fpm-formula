{% from 'supervisor/lib.sls' import supervise with context %}
{% from "php-fpm/map.jinja" import php_fpm with context %}


include:
  - .devel
  - supervisor
  - nginx
  - repos


libxml2-dev:
  pkg:
    - installed


libcurl4-openssl-dev:
  pkg:
    - installed


php:
  pkg:
    - installed
    - name: {{php_fpm.pkg}}


/var/run/php5-fpm:
  file:
    - directory
    - mode: 700
    - user: nginx
    - group: nginx


/usr/local/lib/php.ini:
  file:
    - managed
    - source: salt://php-fpm/templates/php.ini
    - user: root
    - group: root
    - mode: 644
    - template: jinja
    - watch_in:
      - service: supervisor


/etc/php5:
  file:
    - directory
    - mode: 775
    - user: root
    - group: root


/etc/php5/fpm:
  file:
    - directory
    - mode: 775
    - user: root
    - group: root
    - require:
      - file: /etc/php5


/etc/php5/fpm/php-fpm.conf:
  file:
    - absent
    - requires:
      - file: /etc/php5/fpm


/var/lib/php/session:
  file:
    - directory
    - user: nginx
    - group: webservice
    - mode: 775
    - makedirs: True
    - watch_in:
      - service: supervisor
    - require:
      - pkg: nginx
      - pkg: php


{% for pool_name, pool_config in php_fpm.pools.iteritems() %}

{% if 'absent' in pool_config %}
/etc/php5/fpm/pool.d/{{pool_name}}.conf:
  file:
    - absent
    - watch_in:
      - service: supervisor

#TODO: unsupervise for completness

{% else %}
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


{% endif %}

{% endfor %}
