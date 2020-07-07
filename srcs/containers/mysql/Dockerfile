FROM alpine:latest

RUN apk update && \
    apk add mysql && \
    apk add mysql-client

COPY my.cnf /etc/mysql/
COPY init.sh .

ENTRYPOINT sh init.sh
