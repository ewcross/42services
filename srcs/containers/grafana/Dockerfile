FROM alpine:latest

RUN apk update && \
    apk add vim --no-cache

RUN wget https://s3-us-west-2.amazonaws.com/grafana-releases/release/grafana-5.0.0.linux-x64.tar.gz
RUN tar -zxvf grafana-5.0.0.linux-x64.tar.gz

COPY datasources.yaml .
COPY dashboard.yaml .
COPY dashboard.json .

EXPOSE 3000

ENTRYPOINT bin/sh
#ENTRYPOINT cd /usr/share/grafana && /usr/sbin/grafana-server
