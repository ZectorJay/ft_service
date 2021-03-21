kubectl delete deploy nginx-dep
kubectl delete svc nginx-svc
eval $(minikube -p minikube docker-env)
sleep 0.5
docker build srcs/nginx/ -t nginx_image
kubectl apply -f srcs/yaml/nginx.yaml

