FROM alpine:latest

RUN apk update

RUN wget https://dl.influxdata.com/telegraf/releases/telegraf-1.13.3-static_linux_amd64.tar.gz
RUN tar -xvf telegraf-1.13.3-static_linux_amd64.tar.gz
RUN rm -rf telegraf-1*
RUN mkdir -p /etc/telegraf/
RUN chmod +x telegraf/*
COPY telegraf.conf /etc/telegraf/telegraf.conf

ENTRYPOINT /telegraf/telegraf
