FROM alpine:latest

RUN apk update && \
    apk add openssl --no-cache && \
    apk add pure-ftpd --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted --no-cache

EXPOSE 21
EXPOSE 21000

COPY setup.sh .

ENTRYPOINT sh setup.sh
