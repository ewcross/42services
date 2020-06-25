#! /bin/sh

sed -i 's/#   include "mod_fastcgi.conf"/include "mod_fastcgi.conf"/g' /etc/lighttpd/lighttpd.conf
sed -i 's/php-cgi/php-cgi7/g' /etc/lighttpd/mod_fastcgi.conf

# put environment variables (defined in wp.yaml) in wp-config file
sed -i 's/WP_DB_NAME/'$WP_DB_NAME'/g' /var/www/localhost/htdocs/wordpress/wp-config.php
sed -i 's/WP_DB_USER/'$WP_DB_USER'/g' /var/www/localhost/htdocs/wordpress/wp-config.php
sed -i 's/WP_DB_PASSWORD/'$WP_DB_PASSWORD'/g' /var/www/localhost/htdocs/wordpress/wp-config.php
sed -i 's/WP_DB_HOST/'$WP_DB_HOST'/g' /var/www/localhost/htdocs/wordpress/wp-config.php

openrc
touch /run/openrc/softlevel
rc-update add lighttpd default
rc-service lighttpd start

while : ;
do sleep 1;
done
