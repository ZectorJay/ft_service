#!/bin/bash
kubectl delete deploy nginx-dep
kubectl delete deploy wordpress-dep
kubectl delete svc nginx-service
kubectl delete svc wordpress-service
kubectl delete kubernetes
./start.sh
kubectl get deploy
