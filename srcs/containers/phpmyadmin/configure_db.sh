#!/bin/sh

# put environment variables (defined in phpmyadmin.yaml) in config.inc.php
sed -i 's/DB_HOST/'$DB_HOST'/g' /www/localhost/phpmyadmin/config.inc.php
sed -i 's/DB_PORT/'$DB_PORT'/g' /www/localhost/phpmyadmin/config.inc.php
sed -i 's/DB_USER/'$DB_USER'/g' /www/localhost/phpmyadmin/config.inc.php
sed -i 's/DB_PASSWORD/'$DB_PASSWORD'/g' /www/localhost/phpmyadmin/config.inc.php

# openrc
# touch /run/openrc/softlevel
# rc-service php-fpm7 start