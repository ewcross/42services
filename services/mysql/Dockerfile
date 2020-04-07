FROM alpine

RUN apk update \
	&& apk add vim \
	&& apk add mysql \
	&& apk add mysql-client \
	&& apk add openrc

ENTRYPOINT service mariadb start && /bin/sh
