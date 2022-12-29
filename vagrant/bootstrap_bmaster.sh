#!/bin/bash

echo "[TASK 1] Pull required containers"
kubeadm config images pull >/dev/null 2>&1

echo "[TASK 2] Initialize Kubernetes Cluster"
TOKEN=$(kubeadm token generate)
kubeadm init --token=${TOKEN} --apiserver-advertise-address=192.168.1.100 --kubernetes-version=v1.25.5 --pod-network-cidr=10.244.0.0/16 >> /root/kubeinit.log 2>/dev/null

echo "[TASK 3] Deploy Calico network"
kubectl --kubeconfig=/etc/kubernetes/admin.conf create -f https://docs.projectcalico.org/v3.18/manifests/calico.yaml >/dev/null 2>&1

echo "[TASK 4] Generate and save cluster join command to /joincluster.sh"
kubeadm --kubeconfig=/etc/kubernetes/admin.conf token create --print-join-command > /home/vagrant/joincluster.sh 2>/dev/null

echo "[TASK 5] Setup Kubernetes config for vagrant user"
mkdir -p /home/vagrant/.kube
cp /etc/kubernetes/admin.conf /home/vagrant/.kube/config
chown vagrant:vagrant /home/vagrant/.kube/config

echo "[TASK 6] Setup kubectl alias"
echo "alias k=kubectl" >> /home/vagrant/.bashrc
source /home/vagrant/.bashrc
 
