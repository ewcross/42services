#!/bin/bash

minikube_ip=$(minikube ip)
nums=$(echo $minikube_ip | tr "." "\n")
arr=($nums)
min="${arr[0]}.${arr[1]}.${arr[2]}.$((${arr[3]} + 5))"
max="${arr[0]}.${arr[1]}.${arr[2]}.$((${arr[3]} + 20))"
sed -i '' "s/MIN_IP/${min}/g" yaml_files/metallb.yaml
sed -i '' "s/MAX_IP/${max}/g" yaml_files/metallb.yaml
