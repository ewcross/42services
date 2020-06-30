FROM alpine:latest

RUN apk update && \
    apk add vim && \
    apk add openssl --no-cache && \
    apk add pure-ftpd --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted --no-cache

EXPOSE 21
#EXPOSE 21000

COPY setup.sh .

ENTRYPOINT sh setup.sh && pure-ftpd -Y2 -P 192.168.64.24
#ENTRYPOINT sh setup.sh && pure-ftpd -j -Y 2 -p 21000:21000 -P MINIKUBE_IP
