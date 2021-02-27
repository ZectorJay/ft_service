way=./srcs/yaml
#make docker work inside container (minikube)
minikube addons enable metallb
eval $(minikube docker-env)
kubectl apply -f $way/configmap.yaml
Docker build ./srcs/nginx/ -t nginx_image
kubectl apply -f $way/nginx.yaml
Docker build ./srcs/wordpress/ -t wordpress_image
kubectl apply -f $way/wordpress.yaml
