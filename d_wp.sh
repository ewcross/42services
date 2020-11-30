#!/bin/bash

kubectl delete svc wordpress
kubectl delete deployment wordpress
kubectl delete pv wordpress-pv
kubectl delete pvc wordpress-pvc
