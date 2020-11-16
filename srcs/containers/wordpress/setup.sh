#! /bin/sh

#sed -i 's/#   include "mod_fastcgi.conf"/include "mod_fastcgi.conf"/g' /etc/lighttpd/lighttpd.conf
#sed -i 's/php-cgi/php-cgi7/g' /etc/lighttpd/mod_fastcgi.conf

# put environment variables (defined in wp.yaml) in wp-config file
sed -i 's/WP_DB_NAME/'$WP_DB_NAME'/g' /www/localhost/wordpress/wp-config.php
sed -i 's/WP_DB_USER/'$WP_DB_USER'/g' /www/localhost/wordpress/wp-config.php
sed -i 's/WP_DB_PASSWORD/'$WP_DB_PASSWORD'/g' /www/localhost/wordpress/wp-config.php
sed -i 's/WP_DB_HOST/'$WP_DB_HOST'/g' /www/localhost/wordpress/wp-config.php

# add code to end of functions.php to create admin user and multiple editors
cat add_functions.php >> /www/localhost/wordpress/wp-content/themes/twentytwenty/functions.php

openrc
touch /run/openrc/softlevel
rc-service php-fpm7 start

# without telegraf need this
#while : ;
#do sleep 1;
#done
