FROM alpine:latest

RUN apk update && \
    apk add influxdb --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted --no-cache

EXPOSE 8086

ENTRYPOINT influxd
