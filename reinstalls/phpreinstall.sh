kubectl delete deploy phpmyadmin-dep
kubectl delete svc phpmyadmin-svc
eval $(minikube -p minikube docker-env)
sleep 0.5
docker build srcs/phpmyadmin/ -t php_image
kubectl apply -f srcs/yaml/phpmyadmin.yaml

