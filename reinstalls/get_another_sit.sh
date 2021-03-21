#first remove Docker and Docker Tool Box. Following 3 commands have to be done before launch this script
mkdir -p ~/goinfre/docker
rm -rf ~/Library/Containers/com.docker.docker
ln -s ~/goinfre/docker ~/Library/Containers/com.docker.docker
brew install kubectl
rm -f .minikube
mkdir -p ~/goinfre/.minikube
ln -s ~/goinfre/.minikube .minikube
brew install minikube
minikube start --driver=virtualbox --memory=4096 --cpus=3
