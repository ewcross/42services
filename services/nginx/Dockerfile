FROM alpine

RUN apk update \
	&& apk add vim \
	&& apk add nginx

RUN mkdir -p /run/nginx
RUN mkdir -p /www
RUN rm /etc/nginx/nginx.conf
COPY nginx.conf /etc/nginx/
COPY index.html /www/
EXPOSE 80
EXPOSE 443

COPY nginx_setup.sh .

# to reload or stop nginx - '/usr/sbin/nginx -s <reload or stop>'

#ENTRYPOINT nginx && sh -c tail -f /dev/null
ENTRYPOINT sh nginx_setup.sh
