FROM alpine:latest

RUN apk update \
    && apk add vim \
    && apk add openrc \
    && apk add lighttpd php7-common php7-iconv php7-json php7-gd \
    php7-curl php7-xml php7-mysqli php7-imap php7-cgi fcgi php7-pdo \
    php7-pdo_mysql php7-soap php7-xmlrpc php7-posix php7-mcrypt \
    php7-gettext php7-ldap php7-ctype php7-dom

# download and install wordpress
RUN wget http://wordpress.org/latest.tar.gz
RUN tar -xzvf latest.tar.gz && rm latest.tar.gz
RUN rm wordpress/wp-config-sample.php
COPY wp-config.php wordpress/
RUN mv wordpress /var/www/localhost/htdocs/wordpress
COPY index.html /var/www/localhost/htdocs/
RUN chown -R lighttpd /var/www/localhost/htdocs/

# this file contains code for adding worpdress users (see init.sh)
COPY add_functions.php .

COPY init.sh .

EXPOSE 80

ENTRYPOINT sh init.sh
