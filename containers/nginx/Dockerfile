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

#can try in future without any initialisation - maybe the service does all this, but seems unlikely
COPY nginx_init.sh .

# to reload or stop nginx - '/usr/sbin/nginx -s <reload or stop>'

ENTRYPOINT sh nginx_init.sh
#ENTRYPOINT nginx && /bin/sh
