requires supervisor-formula

typical usage
-------------

include:
  - php-fpm


define in pillars what pools are required



optional
--------
include:
  - php-fpm.mongodb
  - php-fpm.zendopcache


available macros
----------------
php_fpm_supervised_pool(
                        pool_name,
                        logship=False
                        )

Based on pillar pool configuration it configures php-fpm pool and setups supervisor to ensure it's running.


examples
--------

{% from 'php-fpm/lib.sls' import php_fpm_supervised_pool with context %}

{{ php_fpm_supervised_pool(
                        'foo',
                        logship=False
                        ) }}
