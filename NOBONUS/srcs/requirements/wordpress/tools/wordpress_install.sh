#!/bin/sh

#Download wordpress cli

wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

#Install wordpress, but retry if it fails. It sometimes fails because of mariadb not being ready yet.

wp core install --path="/var/www/html/wordpress" --allow-root --url=$urlWebsite --title=$titleWebsite --admin_user=$adminName --admin_password=$adminPassword --admin_email=$adminEmail
while [ $? -ne 0 ]; do
	echo retrying ...
	wp core install --path="/var/www/html/wordpress" --allow-root --url=$urlWebsite --title=$titleWebsite --admin_user=$adminName --admin_password=$adminPassword --admin_email=$adminEmail
done

#Create a user for the wordpress website

wp user create --path="/var/www/html/wordpress" --allow-root $user $userEmail --user_pass=$userPassword
