#!/bin/bash

# basic update
sudo apt-get update -y && sudo apt upgrade -y

# install docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
sudo apt update -y
apt-cache policy docker-ce
sudo apt install -y docker-ce
sudo usermod -aG docker $USER


# error handling related docker(cgroup)
echo '{ "exec-opts": ["native.cgroupdriver=systemd"], "log-driver": "json-file", "log-opts": { "max-size": "100m" }, "storage-driver": "overlay2" }' | sudo tee /etc/docker/daemon.json > /dev/null

sudo systemctl enable docker
sudo systemctl daemon-reload
sudo systemctl restart docker
sudo rm /etc/containerd/config.toml
sudo systemctl restart containerd

curl -LO https://dl.k8s.io/release/v1.24.9/bin/linux/amd64/kubectl
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl