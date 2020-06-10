#! /bin/sh

sed -i 's/#   include "mod_fastcgi.conf"/include "mod_fastcgi.conf"/g' /etc/lighttpd/lighttpd.conf
sed -i 's/php-cgi/php-cgi7/g' /etc/lighttpd/mod_fastcgi.conf
openrc
touch /run/openrc/softlevel
rc-update add lighttpd default
rc-service lighttpd start

while : ;
do sleep 1;
done
