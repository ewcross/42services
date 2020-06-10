#! /bin/sh

mariadb-install-db --user=mysql --basedir=/usr --datadir=/var/lib/mysql
mysqld_safe &

sleep 5

echo 'creating new database...'
mysql -e "CREATE DATABASE $DB_NAME"
echo 'granting privileges'
mysql -e "GRANT ALL PRIVILEGES ON '$DB_NAME'.* TO '$DB_USER'@'%' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD'"
echo 'flushing privileges'
mysql -e "FLUSH PRIVILEGES"

echo 'looping'
while : ;
do sleep 1;
done
