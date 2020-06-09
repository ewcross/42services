FROM alpine

RUN apk update \
	&& apk add vim \
	&& apk add php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session
#	&& apk add php-fpm \
#	&& apk add php-mysqli \
#	&& apk add php-mbstring

RUN wget http://wordpress.org/latest.tar.gz
RUN tar -xzvf latest.tar.gz
RUN rm latest.tar.gz
COPY wp-config.php /wordpress
COPY index.php .

COPY wp_init.sh .

#RUN php -S 0.0.0.0:5050 -t /www/ - try this

EXPOSE 9000

ENTRYPOINT sh wp_init.sh
