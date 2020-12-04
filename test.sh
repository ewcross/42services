#!/bin/bash

kubectl delete svc phpmyadmin
kubectl delete deployment phpmyadmin

# kubectl delete svc nginx
# kubectl delete deployment nginx
# kubectl delete svc wordpress
# kubectl delete deployment wordpress

# docker build -t nginx:v1 srcs/containers/nginx/
# docker build -t wordpress:v1 srcs/containers/wordpress/
# docker build -t mysql:v1 srcs/containers/mysql/
docker build -t phpmyadmin:v1 srcs/containers/phpmyadmin/

# kubectl apply -f srcs/yaml_files/nginx.yaml

# kubectl apply -f srcs/yaml_files/wordpress.yaml
# kubectl apply -f srcs/yaml_files/volumes/wordpress-pvc.yaml
# kubectl apply -f srcs/yaml_files/volumes/wordpress-pv.yaml

# kubectl apply -f srcs/yaml_files/mysql.yaml
# kubectl apply -f srcs/yaml_files/volumes/mysql-pvc.yaml
# kubectl apply -f srcs/yaml_files/volumes/mysql-pv.yaml

kubectl apply -f srcs/yaml_files/phpmyadmin.yaml

# kubectl apply -f srcs/yaml_files/metallb.yaml