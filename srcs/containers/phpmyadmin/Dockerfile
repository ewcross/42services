FROM alpine:latest

RUN apk update && \
    apk add vim --no-cache && \
    apk add php7 php7-fpm php7-opcache php7-gd \
    php7-mysqli php7-zlib php7-curl php7-mbstring \
    php7-json php7-session --no-cache

RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.0.1/phpMyAdmin-5.0.1-all-languages.tar.gz
RUN tar xf *.tar.gz
RUN rm *tar.gz
RUN mkdir -p /var/www && mv phpMyAdmin* /var/www/phpmyadmin
COPY config.inc.php /var/www/phpmyadmin
RUN rm /var/www/phpmyadmin/config.sample.inc.php

EXPOSE 5000

ENTRYPOINT php -S 0.0.0.0:5000 -t /var/www/
