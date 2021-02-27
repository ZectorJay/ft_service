#!/bin/bash
minikube delete
minikube start --vm-driver=virtualbox
./start.sh
