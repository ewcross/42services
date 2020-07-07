FROM alpine:latest

RUN apk update && \
    apk add grafana --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted --no-cache

COPY datasources.yaml /usr/share/grafana/conf/provisioning/datasources/
COPY dashboard.yaml /usr/share/grafana/conf/provisioning/dashboards/
RUN rm /usr/share/grafana/conf/provisioning/datasources/sample.yaml
RUN rm /usr/share/grafana/conf/provisioning/dashboards/sample.yaml

COPY dashboard.json /usr/share/grafana/conf/provisioning/dashboards/

EXPOSE 3000

ENTRYPOINT cd /usr/share/grafana && /usr/sbin/grafana-server
