# ft_services

A kubernetes cluster consisting of multiple services, each running in a dedicated Docker container.

## Details

Kubernetes is run using Minikube inside the Hyperkit hypervisor on MacOS.

All docker containers are running Alpine Linux.

External acces to the cluster's services is managed by the MetalLB load balancer.

The services included are:

  * Nginx server (ports 80, 443 (SSL) and 22 (SSH)) - port 80 systematically redirects to port 443
  * FTPS server (port 21)
  * Wordpress website with several users and an admin (port 5050)
  * PhpMyAdmin (port 5000)
  * Grafana platform for container monitoring, with pre-configured dashboard (port 3000)
  
The Wordpress service uses a MySQL database, which is run as a separate deployment within the cluster. The PhpMyAdmin service is also linked with this database.

The container metrics displayed in the Grafana platform are collected using Telegraf, and stored in an InfluxDB database, both of which are run as a separate deployments in the cluster.

## Usage

Setup of the cluster is all handled by the ```setup.sh``` script. Simply run this script to launch the cluster: (```./setup.sh```). This script is specifically for setup on MacOS.

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
