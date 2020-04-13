#! /bin/sh

mysqld_safe &

sleep 5

mysql -e "CREATE DATABASE new_db"
mysql -e "GRANT ALL PRIVILEGES ON new_db.* TO 'new_user'@'localhost' IDENTIFIED BY 'user123'"
mysql -e "FLUSH PRIVILEGES"

while : ;
do sleep 1;
done
