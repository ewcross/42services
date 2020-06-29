#!/bin/sh

# put environment variables (defined in phpmyadmin.yaml) in config.inc.php
sed -i 's/DB_HOST/'$DB_HOST'/g' /var/www/phpmyadmin/config.inc.php
sed -i 's/DB_PORT/'$DB_PORT'/g' /var/www/phpmyadmin/config.inc.php
sed -i 's/DB_USER/'$DB_USER'/g' /var/www/phpmyadmin/config.inc.php
sed -i 's/DB_PASSWORD/'$DB_PASSWORD'/g' /var/www/phpmyadmin/config.inc.php
