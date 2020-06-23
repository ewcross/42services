FROM alpine:latest

RUN apk update && \
    apk add vim && \
    apk add openssl openssh nginx --no-cache

# download and set up telegraf
RUN wget https://dl.influxdata.com/telegraf/releases/telegraf-1.13.3-static_linux_amd64.tar.gz
RUN tar -xvf telegraf-1.13.3-static_linux_amd64.tar.gz
RUN rm -rf telegraf-1*
RUN mkdir -p /etc/telegraf/
RUN chmod +x telegraf/*
COPY telegraf.conf /etc/telegraf/telegraf.conf

# create directories for nginx and add config files
RUN mkdir -p /run/nginx
RUN rm /etc/nginx/nginx.conf
COPY nginx.conf /etc/nginx/
RUN mkdir -p /www/localhost
COPY index.html /www/localhost

# create key pair for ssl
RUN mkdir -p /etc/nginx/ssl/private
RUN mkdir -p /etc/nginx/ssl/certs
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/nginx/ssl/private/nginx.key \
    -out /etc/nginx/ssl/certs/nginx.crt \
    -subj "/C=FR/ST=./L=./O=42/CN=localhost"

# set up ssh
COPY ssh_host_rsa_key /etc/ssh/
RUN chmod 600 /etc/ssh/ssh_host_rsa_key
COPY sshd_config /etc/ssh/
COPY motd /etc/
COPY add_user.sh .

# to reload or stop nginx - '/usr/sbin/nginx -s <reload or stop>'

EXPOSE 80
EXPOSE 443
EXPOSE 22

ENTRYPOINT /usr/sbin/sshd && sh ./add_user.sh && nginx && /telegraf/telegraf

#COPY loop.sh .
#ENTRYPOINT /usr/sbin/sshd && sh ./add_user.sh && nginx && sh loop.sh
