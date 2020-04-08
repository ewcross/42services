#! /bin/bash

#to install minikube - go here - https://kubernetes.io/docs/tasks/tools/install-minikube/
#check if hyperkit or another driver is already installed
#to set default driver - minikube config set vm-driver <driver_name>

#also need to install kubectl and docker (with docker-compose)

#start minikube, which starts a single node cluster running in a VM
minikube start

#point docker to daemon within VM
eval $(minikube docker-env)

#run 'docker-compose build' to build all containers (uses docker-compose.yml in current directory) 

#create deployment
#kubectl create -f manifest.yaml

#expose single deployment - use LoadBalancer to assign fixed external IP to service
#kubectl expose deployment <deployment_name> --type=LoadBalancer --port=<port>

#need to create a deployment which specifies all containers (built from docker-compose)
#then need to start services from this deployment
