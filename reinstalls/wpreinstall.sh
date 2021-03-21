kubectl delete deploy wordpress-dep
kubectl delete svc wordpress-svc
eval $(minikube -p minikube docker-env)
sleep 0.5
docker build srcs/wordpress/ -t wordpress_image
kubectl apply -f srcs/yaml/wordpress.yaml

