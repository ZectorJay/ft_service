way=./srcs/yaml

minikube ssh 'sudo mkdir /mnt/mysql; sudo chmod 777 /mnt/mysql'
minikube ssh 'sudo mkdir /mnt/influxdb; sudo chmod 777 /mnt/influxdb'
#enable metallb + configmap
minikube addons enable metallb
eval $(minikube -p minikube docker-env)
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
#build images
Docker build ./srcs/nginx/ -t nginx_image
Docker build ./srcs/wordpress/ -t wordpress_image
Docker build ./srcs/ftps/ -t ftps_image
Docker build ./srcs/mysql/ -t mysql_image
docker build srcs/phpmyadmin/ -t php_image
docker build srcs/influxdb/ -t influxdb_image
docker build srcs/grafana/ -t grafana_image
#apply yaml
kubectl apply -f $way/configmap.yaml
kubectl apply -f $way/nginx.yaml
kubectl apply -f $way/ftps.yaml
kubectl apply -f $way/wordpress.yaml
kubectl apply -f $way/phpmyadmin.yaml
kubectl apply -f $way/influxdb.yaml
kubectl apply -f $way/mysql.yaml
kubectl apply -f $way/grafana.yaml
