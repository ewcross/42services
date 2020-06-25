FROM alpine:latest

RUN apk update && \
    apk add vim --no-cache && \
    apk add grafana --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted --no-cache

RUN mkdir -p /etc/grafana/provisioning/dashboards

COPY datasources.yml /usr/share/grafana/conf/provisioning/datasources/

EXPOSE 3000

ENTRYPOINT cd /usr/share/grafana && /usr/sbin/grafana-server
