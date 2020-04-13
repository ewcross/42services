FROM alpine

RUN apk update \
	&& apk add vim \
	&& apk add nginx

RUN mkdir -p /run/nginx
RUN rm /etc/nginx/nginx.conf
COPY index.html .

EXPOSE 80
EXPOSE 443

#can try in future without any initialisation - maybe the service does all this, but seems unlikely
COPY nginx_init.sh .

# to reload or stop nginx - '/usr/sbin/nginx -s <reload or stop>'

ENTRYPOINT sh nginx_init.sh
