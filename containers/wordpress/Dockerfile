FROM alpine

RUN apk update \
	&& apk add vim \
	&& apk add php-fpm \
	&& apk add php-mysqli \
	&& apk add php-mbstring

RUN wget http://wordpress.org/latest.tar.gz
RUN tar -xzvf latest.tar.gz
RUN rm latest.tar.gz
COPY wp-config.php /wordpress
#these wordpress files are then moved into the volume shared with nginx container in 
#the deployment yaml file

COPY index.php .
COPY wp_init.sh .

EXPOSE 9000

ENTRYPOINT sh wp_init.sh
