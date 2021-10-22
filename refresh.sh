#!/bin/bash

# refresh bare-metal nodes

sudo apt-mark unhold kubeadm kubelet kubectl
sudo apt-get remove -y kubeadm kubelet kubectl
sudo apt-get update
sudo apt-get install -y kubeadm=1.21.0-00 kubelet=1.21.0-00 kubectl=1.21.0-00
sudo apt-mark hold kubeadm kubelet kubectl
sudo swapoff -a
