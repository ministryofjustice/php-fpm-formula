## Version 1.0.9

* Added new options for a php package (pkg) and settings for pool socket listners (socketuser, socketgroup, socketmode).

## Version 1.0.8

* Add optional skip_verify with a sensible default False set via php_fpm.pkg_skip_verify.

## Version 1.0.5

* Remove reference to shared dir in a macro: creates conflict if >1 deployed locally

## Version 1.0.4

* Fix start.sh to exec php-fpm. Processes were being left behind when called as a subprocess.

## Version 1.0.3

* Use state.pecl rather than relying on state.cmd calling out to pecl.

## Version 1.0.2

* Supervisord now starts PHP-FPM via a bash script, allowing us to ensure all required directories exist.

## Version 1.0.1

* Ensure /etc/php-fpm/pools.d directory is created

## Version 1.0.0

* Initial release
