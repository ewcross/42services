FROM alpine

RUN apk update && \
    apk add vim && \
    apk add mysql && \
    apk add mysql-client

COPY my.cnf /etc/mysql/
COPY init.sh .

ENTRYPOINT sh init.sh
#ENTRYPOINT /bin/sh
