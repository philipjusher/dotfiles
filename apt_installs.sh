#!/bin/bash
export DEBIAN_FRONTEND=noninteractive
export TZ=Europe

echo "---------------- making it larger this is dev stuff it makes a minimal ubuntu container larger -----------------------"
unminimize

echo "----------------- Getting initial tools needed for addint repos and certificates ect -------------------"
apt-get update &&  apt-get install -yq \
software-properties-common \
apt-transport-https \
ca-certificates \
gnupg-agent \
gnupg2 \
curl \
sudo \
apt-utils

echo "----------------------- Getting Docker Repo ---------------------------------------------------"
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
add-apt-repository \
	"deb [arch=amd64] https://download.docker.com/linux/ubuntu \
	$(lsb_release -cs) \
	stable"

echo "--------------------- Getting VIM repo --------------------------------------------------"
add-apt-repository ppa:jonathonf/vim

echo "------------------------ Getting Kubectl Repo -------------------------------------------"
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | tee -a /etc/apt/sources.list.d/kubernetes.list

echo "--------------------------------- Getting Helm Repo -----------------------------------"
curl https://baltocdn.com/helm/signing.asc | apt-key add -
echo "deb https://baltocdn.com/helm/stable/debian/ all main" | tee /etc/apt/sources.list.d/helm-stable-debian.list

echo "--------------------------------- Installing a lot of things --------------------------"
apt-get update && apt-get install -yq \
wget \
net-tools \
git \
zsh \
tmux \
nodejs \
npm \
yarn \
docker-ce \
docker-ce-cli \
containerd.io \
python3-venv \
python3-pip \
vim \
kubectl \
helm 

sudo update-alternatives --install /usr/bin/pip pip /usr/bin/pip3 1


sudo curl -L "https://github.com/docker/compose/releases/download/1.26.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose



