kubectl delete deploy mysql-dep
kubectl delete svc mysql-svc
eval $(minikube -p minikube docker-env)
sleep 0.5
docker build srcs/mysql/ -t mysql_image
kubectl apply -f srcs/yaml/mysql.yaml

