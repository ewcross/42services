FROM alpine:latest

RUN apk update \
  && apk add nginx\
  && apk add openrc\
  && apk add php7 php7-fpm php7-opcache php7-gd \
  php7-mysqli php7-zlib php7-curl php7-mbstring \
  php7-json php7-session --no-cache

RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.0.1/phpMyAdmin-5.0.1-all-languages.tar.gz
RUN tar xf *.tar.gz
RUN rm *tar.gz

# old
# RUN mkdir -p /var/www && mv phpMyAdmin* /var/www/phpmyadmin
# COPY config.inc.php /var/www/phpmyadmin
# RUN rm /var/www/phpmyadmin/config.sample.inc.php

# new
RUN mkdir -p /run/nginx
RUN rm /etc/nginx/nginx.conf
COPY nginx.conf /etc/nginx/
RUN mkdir -p /www/localhost
COPY index.html /www/localhost

RUN mv phpMyAdmin* /www/localhost/phpmyadmin
COPY config.inc.php /www/localhost/phpmyadmin
RUN rm /www/localhost/phpmyadmin/config.sample.inc.php

COPY setup.sh .

# EXPOSE 5000
EXPOSE 80

# ENTRYPOINT sh setup.sh && php -S 0.0.0.0:5000 -t /www/localhost/phpmyadmin/
ENTRYPOINT sh setup.sh && nginx -g "daemon off;"
