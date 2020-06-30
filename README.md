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

Setup of the cluster is handled

## Resources

* [Kubernetes.io](kubernetes.io)
