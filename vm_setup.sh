#!bin/bash

# check all packages are installed and install using homebrew if not
echo "\033[1;31mChecking for necessary packages...\033[0m";

# some of the installations may need changing so they happen quietly

#which brew
#if [ $? != 0 ]; then
#	echo "\033[1;31mhomebrew not installed, I'll install it...\033[0m";
#	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
#fi

which kubectl > /dev/null 2>&1
if [ $? != 0 ]; then
	echo "\033[1;31mkubectl not installed, I'll install it....\033[0m";
#	brew install kubectl
fi

which minikube > /dev/null 2>&1
if [ $? != 0 ]; then
	echo "\033[1;31mminikube not installed, I'll install it...\033[0m";
#	brew install minikube
fi

which virtualbox > /dev/null 2>&1
if [ $? != 0 ]; then
	echo "\033[1;31mvirtualbox not installed, I'll install it...\033[0m";
#	brew install hyperkit
fi

which docker > /dev/null 2>&1
if [ $? != 0 ]; then
	echo "\033[1;31mdocker not installed, I'll install it...\033[0m";
	#brew install docker
fi

echo "\033[1;35mStarting minikube...\033[0m"
#may need to start docker here
minikube start --vm-driver=docker

# point this shell to minikube docker-daemon
eval $(minikube docker-env)

# edit kube-proxy config settings for metallb
echo "\n\033[1;35mConfiguring kube-proxy settings for MetalLB...\033[0m"
kubectl get configmap kube-proxy -n kube-system -o yaml | \
sed -e "s/strictARP: false/strictARP: true/" | \
kubectl apply -f - -n kube-system

# install metallb for ingress
echo "\n\033[1;35mInstalling MetalLB...\033[0m"
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/metallb.yaml
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"

# get minikube ip and use to generate ip pool for metallb (in metallb.yaml)
echo "\n\033[1;35mConfiguring MetalLB load balancer IP addresses...\033[0m"
minikube_ip=$(minikube ip)
nums=$(echo $minikube_ip | tr "." "\n")
arr=($nums)
metallb_min_ip="${arr[0]}.${arr[1]}.${arr[2]}.$((${arr[3]} + 5))"
metallb_max_ip="${arr[0]}.${arr[1]}.${arr[2]}.$((${arr[3]} + 20))"

# put lowest ip in all yaml files so all services share same ip
for f in srcs/yaml_files/*
do
	if [ -d "$f" ]; then
		continue
	fi
	sed -i '' "s/MIN_IP/${metallb_min_ip}/g" $f
done
sed -i '' "s/MAX_IP/${metallb_max_ip}/g" srcs/yaml_files/metallb.yaml

# add same ip to index.html for nginx to serve
sed -i '' "s/MIN_IP/${metallb_min_ip}/g" srcs/containers/nginx/index.html
# add same ip to nginx.conf to give 301 redirection the correct address
sed -i '' "s/MIN_IP/${metallb_min_ip}/g" srcs/containers/nginx/nginx.conf
# add same ip to nginx conf file for redirect to wordpress
sed -i '' "s/MIN_IP/${metallb_min_ip}/g" srcs/containers/wordpress/nginx.conf
# add same ip to nginx index.html for link to wordpress
sed -i '' "s/MIN_IP/${metallb_min_ip}/g" srcs/containers/wordpress/index.html
# add same ip to nginx conf file for redirect to wordpress
sed -i '' "s/MIN_IP/${metallb_min_ip}/g" srcs/containers/phpmyadmin/nginx.conf
# add same ip to nginx index.html for link to wordpress
sed -i '' "s/MIN_IP/${metallb_min_ip}/g" srcs/containers/phpmyadmin/index.html

sleep 2;

# build all docker images
echo "\n\033[1;35mBuilding docker images...\033[0m"

for dir in srcs/containers/*
do
	container=$(basename $dir)
	echo "\033[1;35mBuilding $container image...\033[0m"
	docker build -t $container:v1 $dir
done

# apply yaml files
echo "\n\033[1;35mDeploying services...\033[0m"

for f in srcs/yaml_files/*
do
	if [ -d "$f" ]; then
		for pv in $f/*
		do
			if [ -d "$pv" ]; then
				continue;
			fi
			kubectl apply -f $pv
		done
	fi
	kubectl apply -f $f
done

echo "\n\033[1;35mCluster is set up. Go to \033[1;36m$metallb_min_ip\033[1;35m to access services.\033[0m"
echo "\033[1;35mTo access the kubernetes dashboard, use the command \033[1;36mminikube dashboard\033[1;35m.\033[0m"
echo "\033[1;35mTo shut down the cluster, run \033[1;36msh shutdown_minikube.sh\033[1;35m.\033[0m"
