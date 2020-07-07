# ft_services

A kubernetes cluster consisting of multiple services, each running in a dedicated Docker container.

## Details

Kubernetes is run using Minikube inside the Hyperkit hypervisor on MacOS.

All docker containers are running Alpine Linux.

External acces to the cluster's services is managed by the MetalLB load balancer.

The services included are:

  * Nginx server (ports 80, 443 (SSL) and 22 (SSH))
  * FTPS server (port 21)
  * Wordpress website (port 5050)
  * Phpmyadmin (port 5000)
  * MySQL database (linked with Wordpress and MySQL)
  * Grafana platform for container monitoring (port 3000)
  * InfluxDB database (linked with Grafana)
  * MetalLB load balancer
  
The container metrics displayed in the Grafana platform are collected using Telegraf.

## Usage

Setup of the cluster is all handled by the ```setup.sh``` script. Simply run this script to launch (```./setup.sh```).

## Resources

* [Kubernetes.io](kubernetes.io)
* [Setting up Nginx on Alpine Linux](https://wiki.alpinelinux.org/wiki/Nginx)
* [Introduction to yaml](https://www.mirantis.com/blog/introduction-to-yaml-creating-a-kubernetes-deployment/)
* [PHP-FPM, Nginx, Kubernetes, and Docker](https://matthewpalmer.net/kubernetes-app-developer/articles/php-fpm-nginx-kubernetes.html)
* [WordPress and MySQL on Kubernetes](https://medium.com/@containerum/how-to-deploy-wordpress-and-mysql-on-kubernetes-bda9a3fdd2d5)
* [Deploy a PHP Application with Kubernetes](https://www.digitalocean.com/community/tutorials/how-to-deploy-a-php-application-with-kubernetes-on-ubuntu-16-04)
* [MetalLB](https://metallb.universe.tf)
* [MetalLB & Minikube](https://medium.com/@shoaib_masood/metallb-network-loadbalancer-minikube-335d846dfdbe)
* [MetalLB Configuration in Minikube](https://medium.com/faun/metallb-configuration-in-minikube-to-enable-kubernetes-service-of-type-loadbalancer-9559739787df)
