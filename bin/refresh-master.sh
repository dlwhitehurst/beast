# This is a wipe and re-install script for the Beast cluster (master).
#
# author:  David L Whitehurst
# dated:   Nov 23, 2021
#

sudo systemctl stop kubelet

sudo apt-mark unhold kubeadm kubelet kubectl
sudo apt-get remove -y kubeadm kubelet kubectl

sudo rm -rf /etc/kubernetes
sudo rm -rf /var/lib/etcd
sudo rm -rf /var/lib/kubelet

sudo apt-get update
sudo apt-get install -y kubeadm=1.21.0-00 kubelet=1.21.0-00 kubectl=1.21.0-00
sudo apt-mark hold kubeadm kubelet kubectl

sudo swapoff -a

sudo kubeadm reset
