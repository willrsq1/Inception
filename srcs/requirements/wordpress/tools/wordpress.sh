#!/bin/sh

cd /var/www/html/

wget https://wordpress.org/latest.tar.gz
tar -xvf latest.tar.gz
rm latest.tar.gz
chown -R www-data:www-data /var/www/html/wordpress
cd wordpress
sed -i "s/username_here/$MYSQL_USER/g" wp-config-sample.php
sed -i "s/password_here/$MYSQL_PASSWORD/g" wp-config-sample.php
sed -i "s/localhost/$MYSQL_HOSTNAME/g" wp-config-sample.php
sed -i "s/database_name_here/$MYSQL_DATABASE/g" wp-config-sample.php
cp wp-config-sample.php wp-config.php

wp core install --path="/var/www/html/wordpress" --allow-root --url=$URL_WP --title=$TITLE_WP --admin_user=$ADMIN_WP --admin_password=$ADMIN_PASSWORD_WP --admin_email=$ADMIN_EMAIL_WP
while [ $? -ne 0 ]; do
	echo retrying ...
	wp core install --path="/var/www/html/wordpress" --allow-root --url=$URL_WP --title=$TITLE_WP --admin_user=$ADMIN_WP --admin_password=$ADMIN_PASSWORD_WP --admin_email=$ADMIN_EMAIL_WP
done

wp user create --path="/var/www/html/wordpress" --allow-root $WP_USER $WP_USER_EMAIL --user_pass=$WP_USER_PASSWORD

chown www-data:www-data /var/www/html/wordpress/wp-content/uploads -R
mkdir -p /run/php/
chmod 755 /run/php
php-fpm7.4 -F