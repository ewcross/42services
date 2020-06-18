FROM alpine:latest

RUN apk update && \
    apk add vim && \
    apk add nginx

RUN mkdir -p /run/nginx
RUN rm /etc/nginx/nginx.conf
COPY nginx.conf /etc/nginx/
RUN mkdir -p /www/localhost
COPY index.html /www/localhost

EXPOSE 80
EXPOSE 443

COPY nginx_init.sh .

RUN wget https://dl.influxdata.com/telegraf/releases/telegraf-1.13.3-static_linux_amd64.tar.gz
RUN tar -xvf telegraf-1.13.3-static_linux_amd64.tar.gz
RUN rm -rf telegraf-1*
RUN mkdir -p /etc/telegraf/
RUN chmod +x telegraf/*
COPY telegraf.conf /etc/telegraf/telegraf.conf

# to reload or stop nginx - '/usr/sbin/nginx -s <reload or stop>'

#ENTRYPOINT sh nginx_init.sh

ENTRYPOINT /telegraf/telegraf && sh nginx_init.sh
