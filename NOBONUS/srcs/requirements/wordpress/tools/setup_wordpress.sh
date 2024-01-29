#!/bin/sh

cd /var/www/html/ #go to the folder where wordpress will be installed

#download wordpress

wget https://wordpress.org/latest.tar.gz
tar -xvf latest.tar.gz
	cd wordpress

#setup wordpress using sed

sed -i "s/username_here/$userMariaDB/g" wp-config-sample.php
sed -i "s/password_here/$passwordMariaDB/g" wp-config-sample.php
sed -i "s/localhost/$host/g" wp-config-sample.php
sed -i "s/database_name_here/$database/g" wp-config-sample.php

#the "sample config" file is used as a template for the real config file
#the real config file is now replaced

cp wp-config-sample.php wp-config.php
