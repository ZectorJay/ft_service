#!/bin/bash
minikube delete
minikube start --driver=virtualbox --memory=4096 --cpus=3
./start.sh
