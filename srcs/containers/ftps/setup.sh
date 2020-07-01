#!/bin/sh

#generate private and public key for ftps server, both in pure-ftpd.pem
openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
-keyout /etc/ssl/private/pure-ftpd.pem -out /etc/ssl/private/pure-ftpd.pem \
-subj "/C=EN/ST=./L=./O=42/CN=services_ftps"

#make it private
chmod 600 /etc/ssl/private/*.pem

#add new user using environment variables from ftps.yaml
adduser -D -h /home/$FTPS_USER "$FTPS_USER"
echo "$FTPS_USER:$FTPS_PASSWORD" | chpasswd
touch /home/$FTPS_USER/test_file
