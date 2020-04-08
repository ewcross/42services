FROM alpine

RUN apk update \
	&& apk add vim \
	&& apk add mysql \
	&& apk add mysql-client

RUN mariadb-install-db --user=mysql --basedir=/usr --datadir=/var/lib/mysql
COPY mysql_init.sh .

ENTRYPOINT sh mysql_init.sh
