FROM alpine:latest

RUN apk update \
  && apk add nginx\
  && apk add php7 php7-fpm php7-opcache php7-common php7-iconv php7-json \
  php7-gd php7-curl php7-xml php7-mysqli php7-imap php7-cgi fcgi php7-pdo \
  php7-pdo_mysql php7-soap php7-xmlrpc php7-posix php7-mcrypt \
  php7-gettext php7-ldap php7-ctype php7-dom

RUN apk update \
  && apk add openrc

# download and install wordpress
RUN wget http://wordpress.org/latest.tar.gz
RUN tar -xzvf latest.tar.gz && rm latest.tar.gz
RUN rm wordpress/wp-config-sample.php
COPY wp-config.php wordpress/

# create directories for nginx and add config files
RUN mkdir -p /run/nginx
RUN rm /etc/nginx/nginx.conf
COPY nginx.conf /etc/nginx/
RUN mkdir -p /www/localhost
COPY index.html /www/localhost
RUN mv wordpress /www/localhost/wordpress

# this file contains code for adding worpdress users (see setup.sh)
COPY add_functions.php .

COPY setup.sh .

EXPOSE 80

ENTRYPOINT sh setup.sh && nginx -g "daemon off;"
