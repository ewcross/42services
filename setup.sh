#!bin/bash

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
sed -i '' "s/MIN_IP/${metallb_min}/g" yaml_files/metallb.yaml
sed -i '' "s/MAX_IP/${metallb_max}/g" yaml_files/metallb.yaml

# put lowest ip in all yaml files so all services share same ip
for f in yaml_files/*
do
	if [ -d "$f" ]; then
		continue
	fi
	sed -i '' "s/MIN_IP/${metallb_min_ip}/g" $f
done

# if minikube needs to be restarted put back placeholders in yaml files
#sed -i '' "s/${metallb_min}/MIN_IP/g" yaml_files/metallb.yaml
#sed -i '' "s/${metallb_max}/MAX_IP/g" yaml_files/metallb.yaml
#for f in yaml_files/*
#do
#	if [ -d "$f" ]; then
#		continue
#	fi
#	sed -i '' "s/MIN_IP/${metallb_min_ip}/g" $f
#done
