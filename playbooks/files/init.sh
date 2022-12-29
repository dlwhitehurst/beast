#!/bin/bash
TOKEN=$(sudo kubeadm token generate)
sudo kubeadm init --token=${TOKEN} --kubernetes-version=v1.26.0 --pod-network-cidr=10.150.0.0/16
