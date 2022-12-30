#!/bin/bash
#
# kubeapt.sh - get signing key and set repo for kubernetes install
#
# NOTE: This use needs to be refactored because Ansible warns on
# many steps such as 1) deprecated apt-key and 2) use of other
# modules for small parts of this.
#

# containerd stuff
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmour --batch --yes -o /etc/apt/trusted.gpg.d/docker.gpg
add-apt-repository -y "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

apt update
apt install -y containerd.io

containerd config default | sudo tee /etc/containerd/config.toml >/dev/null 2>&1
sed -i 's/SystemdCgroup \= false/SystemdCgroup \= true/g' /etc/containerd/config.toml

# restart and enable
systemctl restart containerd
systemctl enable containerd

# kubernetes stuff
curl -fsSL  https://packages.cloud.google.com/apt/doc/apt-key.gpg|gpg --dearmor --batch --yes -o /etc/apt/trusted.gpg.d/k8s.gpg
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | tee /etc/apt/sources.list.d/kubernetes.list
