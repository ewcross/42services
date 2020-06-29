#!bin/bash

minikube start

# point this shell to minikube docker-daemon
eval $(minikube docker-env)

# edit kube-proxy config settings for metallb
kubectl get configmap kube-proxy -n kube-system -o yaml | \
sed -e "s/strictARP: false/strictARP: true/" | \
kubectl apply -f - -n kube-system

# install metallb for ingress
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/metallb.yaml
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"

# get minikube ip and use to generate ip pool for metallb (in metallb.yaml)
minikube_ip=$(minikube ip)
nums=$(echo $minikube_ip | tr "." "\n")
arr=($nums)
metallb_min_ip="${arr[0]}.${arr[1]}.${arr[2]}.$((${arr[3]} + 5))"
metallb_max_ip="${arr[0]}.${arr[1]}.${arr[2]}.$((${arr[3]} + 20))"
#sed -i '' "s/MIN_IP/${metallb_min_ip}/g" srcs/yaml_files/metallb.yaml
#sed -i '' "s/MAX_IP/${metallb_max_ip}/g" srcs/yaml_files/metallb.yaml

# put lowest ip in all yaml files so all services share same ip
for f in srcs/yaml_files/*
do
	if [ -d "$f" ]; then
		continue
	fi
	sed -i '' "s/MIN_IP/${metallb_min_ip}/g" $f
done
sed -i '' "s/MAX_IP/${metallb_max_ip}/g" srcs/yaml_files/metallb.yaml

# apply metallb yaml file to finish ingress setup
kubectl apply -f srcs/yaml_files/metallb.yaml

# add same ip to index.html for nginx to serve
sed -i '' "s/MIN_IP/${metallb_min_ip}/g" srcs/containers/nginx/index.html
# add same ip to nginx.conf to give 301 redirection the correct address
sed -i '' "s/MIN_IP/${metallb_min_ip}/g" srcs/containers/nginx/nginx.conf
# add same ip to lighttpd index.html for link to wordpress
sed -i '' "s/MIN_IP/${metallb_min_ip}/g" srcs/containers/wordpress/index.html

# if minikube needs to be restarted put back placeholders in yaml files
#for f in srcs/yaml_files/*
#do
#	if [ -d "$f" ]; then
#		continue
#	fi
#	sed -i '' "s/${metallb_min_ip}/MIN_IP/g" $f
#done
#sed -i '' "s/${metallb_max_ip}/MAX_IP/g" srcs/yaml_files/metallb.yaml
#sed -i '' "s/${metallb_min_ip}/MIN_IP/g" srcs/containers/nginx/index.html
#sed -i '' "s/${metallb_min_ip}/MIN_IP/g" srcs/containers/nginx/nginx.conf
#sed -i '' "s/${metallb_min_ip}/MIN_IP/g" srcs/containers/wordpress/index.html
