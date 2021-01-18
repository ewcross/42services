FROM alpine:latest

#RUN apk update && \
#  apk add grafana --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted --no-cache

RUN apk update && \
    apk add curl libc6-compat && \
    curl https://dl.grafana.com/oss/release/grafana-7.2.1.linux-amd64.tar.gz > grafana.tar.gz

RUN tar xvf grafana.tar.gz && mv grafana-7.2.1 grafana

#COPY datasources.yaml /usr/share/grafana/conf/provisioning/datasources/
#COPY dashboard.yaml /usr/share/grafana/conf/provisioning/dashboards/
#RUN rm /usr/share/grafana/conf/provisioning/datasources/sample.yaml
#RUN rm /usr/share/grafana/conf/provisioning/dashboards/sample.yaml
#COPY dashboard.json /usr/share/grafana/conf/provisioning/dashboards/

RUN rm /grafana/conf/provisioning/datasources/sample.yaml
RUN rm /grafana/conf/provisioning/dashboards/sample.yaml
COPY datasources.yaml /grafana/conf/provisioning/datasources/
COPY dashboard.yaml /grafana/conf/provisioning/dashboards/
COPY dashboard.json /grafana/conf/provisioning/dashboards/

EXPOSE 3000

#ENTRYPOINT cd /usr/share/grafana && /usr/sbin/grafana-server
ENTRYPOINT cd grafana/bin && ./grafana-server
