#!/bin/sh

/tmp/setup_wordpress.sh
/tmp/wordpress_install.sh

chown www-data:www-data /var/www/html/wordpress/wp-content/uploads -R
mkdir -p /run/php/
chmod 755 /run/php

php-fpm7.4 -F