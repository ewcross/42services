#!bin/bash

echo "\033[1;35mRemoving cluster...\033[0m"
# get minikube ip and use to generate ip pool for metallb (in metallb.yaml)
minikube_ip=$(minikube ip)
nums=$(echo $minikube_ip | tr "." "\n")
arr=($nums)
metallb_min_ip="${arr[0]}.${arr[1]}.${arr[2]}.$((${arr[3]} + 5))"
metallb_max_ip="${arr[0]}.${arr[1]}.${arr[2]}.$((${arr[3]} + 20))"

# put back placeholders in necessary files
for f in srcs/yaml_files/*
do
	if [ -d "$f" ]; then
		continue
	fi
	sed -i '' "s/${metallb_min_ip}/MIN_IP/g" $f
done
sed -i '' "s/${metallb_max_ip}/MAX_IP/g" srcs/yaml_files/metallb.yaml
sed -i '' "s/${metallb_min_ip}/MIN_IP/g" srcs/containers/nginx/index.html
sed -i '' "s/${metallb_min_ip}/MIN_IP/g" srcs/containers/nginx/nginx.conf
sed -i '' "s/${metallb_min_ip}/MIN_IP/g" srcs/containers/wordpress/index.html

minikube stop
minikube delete
